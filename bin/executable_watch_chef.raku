#!/usr/bin/env raku
use IO::Notification::Recursive;
my %last-run;
my $supply = watch-recursive(".", :update).grep({ .path.ends-with('json') });

#my $supply = $*CWD.watch.grep({ .path.ends-with('json') });
react whenever $supply {
	my $path = .path;
	my $now = now.Int;
	if %last-run{$path}:!exists || %last-run{$path}+10 < $now {
		say .path;
		%last-run{$path} = $now;
		my $proc = Proc::Async.new(<<./scripts/cnodes>>);
		my $output;
		$proc.stdout.tap( -> $str {
			$output ~= $str;
		});
		await $proc.start;
		"{%*ENV<HOME>}/.cache/cnodes".IO.spurt($output);
	}
}
