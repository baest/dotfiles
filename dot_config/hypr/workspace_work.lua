for i = 1, 6 do
	hl.workspace_rule({
		workspace = i,
		monitor = "desc:Dell Inc. DELL U2721DE 9Y4T023",
	})
end

for i = 7, 9 do
	hl.workspace_rule({
		workspace = 7,
		monitor = "desc:Dell Inc. DELL U2719DC F8BYX13",
	})
end

hl.workspace_rule({
	workspace = 10,
	monitor = "eDP-1",
})
