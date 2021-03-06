#!/bin/bash


# find all "armin van buuren contianing [0-9][0-9][0-9]
# sequence the $smallest and $highest number and give output.

# hack delimiter
#OLDIFS=$IFS
#IFS=$'\n'

helpmsg(){

    #echo -e "sekvens.sh"
	echo -ne "\n"
	echo -e "\tUsage"
	echo -ne "\n"
	echo -e "\t$0/path/to/save/location -n \"armin van buuren a state of trance\" -d 3"
	echo -ne "\n"
	echo -e "\t-t" "\t" "Location of your files"
	echo -e "\t-n" "\t" "Name of podcast/show"
	echo -e "\t-d" "\t" "Digits per episode number (ie. 800 has 3)"
	echo -e "\t-p" "\t" "Prints this message"
	echo -e "\t-h" "\t" "Prints missing shows to a file (default: missing.log)"
	echo -ne "\n"

}

#regex="^(va|armin.van.buuren)+.*a.state.of.trance.*[0-9][0-9][0-9].*2016.*"

#ARCHIVE_PATH=$1

#ARCHIVE_PATH=$(ls "${ARCHIVE_PATH}" | egrep -oi ${regex})

#TEST=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -n)
#lower=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -rnk3 | awk '!x[$2]++')
#upper=$(echo -ne "$ARCHIVE_PATH" "\n"| egrep -o "(_|-)+[0-9]{3}(_|-)+" | tr -d '-' | tr -d '_' | sort -nk3 | awk '!x[2]++')


#echo -ne "$ARCHIVE_PATH"
#echo $lower
#echo $upper


#SEQ=$(seq $lower $upper)


#comm -13 <(echo -e "${TEST}" | sort | uniq) <(echo "${SEQ}")


main(){

	target=""
	name=""
	digits=""
	print_to_file=false

	OLDIFS=$IFS
	
	IFS=$'\n'

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
			helpmsg
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
		*)
			helpmsg
			exit 1
			;;
		esac
	done
	IFS=$OLDIFS
}

prepare_name(){

	# prepares the regex code for generate_list()
	# takes n and d as param.

	#echo $1
	#echo $2

	name_done=$(echo "$2.*(-|_)+[0-9]{$3}+(_|-)+.*" | tr ' ' '.*')
	#echo "$name_done"
	name_done=$1$name_done

}


print_summary(){

	# matches the
	#
	#
	# takes array of folder_list (complete list of releases)

	echo ""
}
generate_list(){

	# generates the first list
	# takes name-regex param

	# implement some kinda path check feature	done

	if [[ -d $target ]];then

		get_folders=$(find $1 -mindepth 1 -maxdepth 1 -type d | egrep -io "$2"| sort -n)
		init=0

		for x in $get_folders;do
			folder_list[init]=${x}
			init=$((init+1))
		done


		#folder_list=$(ls $target| egrep -io $name_done)

		# debug purpose
		for i in ${folder_list[@]};do
			echo -ne "$i\n"
		done
	else
		echo -ne "Target path does not exist. Quitting.\n"
		exit 1
	fi
	#echo ${folder_list[@]}

}


get_sequence(){


	# debugging
	#echo #$folder_list[@]
	#echo ${folder_list[@]} | egrep -io "(_|-)+[0-9]{$1}(_|-)+" | tr -d '-' | tr -d '_' | sort -n


	#for x in $folder_list[@];do
	up=$(echo -ne "${folder_list[@]}" "\n" | egrep -oi "(_|-)+[0-9]{$1}(_|-)+" | tr -d '-' | tr -d '_' | sort -rnk3 | awk '!x[2]++')
	echo -ne "UP: $up\n"

	#done

	#for y in $folder_list[@];do
	
	low=$(echo -ne "${folder_list[@]}" "\n" | egrep -oi "(_|-)+[0-9]{$1}(_|-)+" | tr -d '-' | tr -d '_' | sort -nk3 | awk '!x[2]++')
	echo -ne "LOW: $low\n"

	#done

}




### FUCK THAT
#compare_lists(){

	# compares

#}

#missing_to_file(){

	# writes missing files to list
	# takes param

#}

#main "$@"
#prepare_name "$name" "$digits"
main "$@"
prepare_name "$target" "$name" "$digits"
generate_list "$target" "$name_done"
get_sequence "$digits"
