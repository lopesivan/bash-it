# Load rbebv, if you are using it

cite about-plugin
about-plugin 'printfx, if you are using it'

printfx() {

    TEMP=`getopt -o hbrkwels:c:v:f:p: --long help,write,keep,reset,bold,format:,script:,color:,print: -n "$FUNCNAME" -- "$@"`

    if [ $? != 0 ] ; then return 1 ; fi

    eval set -- "$TEMP";

    local format='%s\n' escape='-E' line='-n' script clear='tput sgr0';

    while [[ ${1:0:1} == - ]]; do
        [[ $1 =~ ^-h|--help ]] && {
            cat <<EOF
            USAGE: $FUNCNAME [OPTIONS] [TEXT]

            OPTIONS

              -s  Adds a line of text to tput script
              -c  Adds a line of text to tput script that sets the foreground
                  color
              -b  Adds a line of text to tput script that activates emboldened
                  text
              -f  Sets the final printf format
              -w  Forces an immediate write of tput script
              -p  Immediately prints data to standard out
              -e  Enabled backslash interpretation in immediate print operations
              -l  Enables line output in immediate print operations
              -k  disables terminal reset on return
              -r  Forces an immediate reset of terminal settings
              -v  Adds multiple lines of script from a shell variable label

              --script  Same as -s
              --color   Same as -c
              --bold    Same as -b
              --format  Same as -f
              --write   Same as -w
              --print   Same as -p
              --keep    Same as -k
              --reset   Same as -r

EOF
            return;
        };

        [[ $1 == -- ]] && { shift; break; };
        [[ $1 == -l ]] && { line=''; shift 1; continue; };
        [[ $1 =~ ^-s|--script$ ]] && { script+="$2"$'\n'; shift 2; continue; };
        [[ $1 =~ ^-c|--color$ ]] && { script+="setf $2"$'\n'; shift 2; continue; };
        [[ $1 =~ ^-b|--bold$ ]] && { script+="bold"$'\n'; shift 1; continue; };
        [[ $1 =~ ^-f|--format$ ]] && { format="${2}"; shift 2; continue; };
        [[ $1 =~ ^-w|--write$ ]] && { tput -S <<<"$script"; script=''; shift 1; continue; };
        [[ $1 =~ ^-p|--print$ ]] && { echo $escape $line "${2}"; escape='-E' line='-n'; shift 2; continue; };
        [[ $1 =~ ^-k|--keep$ ]] && { clear='true'; shift 1; continue; };
        [[ $1 =~ ^-r|--reset$ ]] && { tput sgr0; shift 1; continue; };
        [[ $1 =~ ^-v ]] && { script+="${!2}"$'\n'; shift 2; continue; };
        [[ $1 =~ ^-e ]] && { escape=$1; shift 1; continue; };

        break;
    done

    echo $format;

tput -S <<<"$script";
(( $# )) && printf "$format" "$@";
$clear;

}
