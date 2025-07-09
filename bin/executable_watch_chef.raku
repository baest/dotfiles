#!/usr/bin/env raku
use IO::Notification::Recursive;
my %last-run;
my $dir = IO::Path.new('.');
my $supply = watch-recursive($dir, :update).grep({ .path.ends-with('json') });

save-nodes();

#my $supply = $*CWD.watch.grep({ .path.ends-with('json') });
react whenever $supply {
	my $path = .path;
	my $now = now.Int;
	say .path;
	if %last-run{$path}:!exists || %last-run{$path}+10 < $now {
		say .path;
		%last-run{$path} = $now;
		save-nodes();
	}
}

sub get-nodes () {
	my @output = ();
	my $output;
	my $cnodes = "{%*ENV<HOME>}/bin/cnodes";

	my $proc = Proc::Async.new($cnodes);
	$proc.stdout.tap( -> $str {
		$output ~= $str;
	});
	my $p_cnodes = $proc.start;

	my $p_known_hosts = start {
		my $fh = "{$*HOME}/.ssh/known_hosts".IO.open;
		my $i = 0;
		for ($fh.split: /\s+/, :close) {
			if (($i++) % 3 == 0 && !/'localhost' || ^ \s *$/) {
				@output.push($_);
			}
		}
	}

	await ($p_known_hosts, $p_cnodes);
	#say @known_hosts.sort.unique.grep({!/'localhost' || ^ \s *$/}).join("\n");
	#say @cnodes.sort.unique.grep({!/'localhost' || ^ \s *$/}).join("\n");
	#say .sort.unique;
	@output.append($output.split("\n"));
	return @output.sort.unique.join("\n");
}

sub save-nodes () {
	"{%*ENV<HOME>}/.cache/cnodes".IO.spurt(get-nodes());
}
