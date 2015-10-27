package Gone;

use 5.020002;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
    gone_hello
);

our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
);

our @EXPORT = qw();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Gone', $VERSION);

1;
