---
title: "Perl"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
---

## Use Perl as an AWK alternative

```bash
#       v-n: sed -n like read loop for each line
#      v-a: AWK like fields in @F
#     v-l: remove separator when reading, add back when writing
perl -lane '
	BEGIN { print "BEGIN"; }
	END { print "END"; }
	print "At line number ", $.;
	print "There are ", (scalar @F), " fields";
	print "The first is ", $F[0];
	print "And the last is ", $F[-1];
'
```

## `-lane` in script

`perl -MO=Deparse -lane ''` to get real one

```perl
#!/usr/bin/perl
use strict;
use warnings;

$\ = "\n";

print "BEGIN";
LINE: while (<>) {
	chomp;
	our @F = split ' ';

	print "At line number ", $.;
	print "There are ", (scalar @F), " fields";
	print "The first is ", $F[0];
	print "And the last is ", $F[-1];
}
print "END";
```

## Process Multi-line logs

```perl
#!/usr/bin/perl
use strict;
use warnings;

while (my $l1 = <>) {
	next unless $l1 =~ /^\d{4}-\d\d-\d\d /;  # "2026-12-31 " etc.
	my @rec = ($l1, scalar <>, scalar <>);   # get three lines
	last unless defined $rec[2];
	chomp @rec;
	print join("\t", @rec), "\n";
}
```

## Preprocess with rg

Get a grep context as a hunk.
Overwrapping context is concatenated.
Lines with `^filename:linenumber` are matched lines,
Lines with `^filename-linenumber` are context lines.

```bash
rg -an0C2 --context-separator '\x1e' 'ERROR' logs/ | perl -ne '
BEGIN { $/ = "\x1e\n" }
chomp;
my ($file, @nums, @hits);
for (split /\n/) {
	my ($f, $n, $kind, $text) = /^([^\0]*)\0(\d+)([:-])(.*)/s;
	$file = $f;
	push @nums, $n;
	push @hits, "$n:$text" if $kind eq ":";
}
print "$file $nums[0]-$nums[-1]\t", join(" | ", @hits), "\n"
'
```

For each file from grep -l.

```bash
rg -al0 'ERROR' logs/ | xargs -0 perl script.pl
```

## Pitfalls

```bash
perl -CSD -Mutf8 -e '..'
# -CSD encodes I/O to UTF-8 lossy. Not recommended for possibly broken
#  UTF-8 strings.
# -Mutf8 reads scripts as UTF-8. Such as `.` works for UTF-8 characters but
#  cannot match to byte per byte anymore, which may be a surprise.
```
