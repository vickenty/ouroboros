package Ouroboros;

use 5.020002;
use strict;
use warnings;
use Carp;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

our @EXPORT_OK = qw(
    rusty_hello
);

our %EXPORT_TAGS = (
    all => \@EXPORT_OK,
);

our @EXPORT = qw();

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Rusty', $VERSION);

1;
