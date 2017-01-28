#!/bin/bash


# find all "armin van buuren contianing [0-9][0-9][0-9]
# sequence the $smallest and $highest number and give output.

# hack delimiter
#OLDIFS=$IFS
#IFS=$'\n'


regex="^(va|armin.van.buuren)+.*a.state.of.trance.*[0-9][0-9][0-9].*2016.*"

ARCHIVE_PATH=$1

ARCHIVE_PATH=$(ls "${ARCHIVE_PATH}" | egrep -oi ${regex})

TEST=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -n)
lower=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -rnk3 | awk '!x[$2]++')
upper=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -nk3 | awk '!x[2]++')


echo -ne "$ARCHIVE_PATH"
#echo $lower
#echo $upper


SEQ=$(seq $lower $upper)


comm -13 <(echo -e "${TEST}" | sort | uniq) <(echo "${SEQ}")

echo $upper
echo $lower

if [ -z $name ];then
	readline -o


while getopts "t:n:d:ph" opt; do
	case $opt in	
	t)
		target=$OPTARG
		;;
	n)
		name=$OPTARG
		;;
	d)	
		digits=$OPTARG
		;;
	p)
		# if this is true, tonight we feast
		if $OPT;then
			print_to_file=true
		else
			print_to_file=false
		fi
		;;
	h)
		# prints help msg
		help
		exit 1
		;;
	\?)
		echo "Invalid option. -$OPTARG" >&2
		exit 1
		;;
	:)
		echo "Option -$OPTARG requires an argument." >&2
		exit 1
		;;
	esac
done

