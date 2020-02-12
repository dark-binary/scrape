#!bin/bash/
echo -e "-----------------------------------------"

number_of_users=$(grep '100.*[^:]' /etc/group | wc -l)
echo "Total number of users: $number_of_users"
users=$(grep '100.*[^:]' /etc/group | cut -d: -f1)
echo -e "List of all users: "
echo -e $users
echo -e "\n"


number_of_admin=$(grep sudo /etc/group | cut -d: -f4 | tr ',' '\n' | wc -l)
echo -e "Number of admin users: $number_of_admin"
echo -e "List of admin users: "
admin_users=$(grep sudo /etc/group | cut -d: -f4 | tr ',' '\n')
echo -e $admin_users
echo -e "\n"


let "number_of_non_admin=$number_of_users-$number_of_admin"
echo -e "Number of non admin users: $number_of_non_admin"
echo -e "List of non admin users: "
comm -23 <(tr ' ' $'\n' <<< $users | sort) <(tr ' ' $'\n' <<< $admin_users | sort)

echo -e "-----------------------------------------"
