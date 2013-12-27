#!/usr/bin/perl
#
# checkincludes: Find files included more than once in (other) files.
# Copyright abandoned, 2000, Niels Kristian Bech Jensen <nkbj@image.dk>.
# Sourced from: https://raw.github.com/karelzak/util-linux/master/tools/checkincludes.pl


foreach $file (@ARGV) {
	open(FILE, $file) or die "Cannot open $file: $!.\n";

	my %includedfiles = ();

	while (<FILE>) {
		if (m/^\s*#\s*include\s*[<"](\S*)[>"]/o) {
			++$includedfiles{$1};
		}
	}
	
	foreach $filename (keys %includedfiles) {
		if ($includedfiles{$filename} > 1) {
			print "$file: $filename is included more than once.\n";
		}
	}

	close(FILE);
}
