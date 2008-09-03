use 5.006;
use strict;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME              => 'Tie::IxHash::FixedSize',
    AUTHOR            => 'Michael Schout <mschout@gkg.net>',
    ABSTRACT_FROM     => 'lib/Tie/IxHash/FixedSize.pm',
    VERSION_FROM      => 'lib/Tie/IxHash/FixedSize.pm',
    PREREQ_PM         => {
        'Test::More'  => 0,
        'Tie::IxHash' => 0
    }
);
