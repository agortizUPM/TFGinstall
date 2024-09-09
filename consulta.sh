ldap_query() {
    username="$1"
    ldapsearch -L -b "dc=dc,dc=dc,dc=es" -D "cn=cn,dc=dc,dc=dc,dc=es" -x uid=$username emTArea | grep emTArea: | awk '{print $2}'
  
}
        awk '{print $1, $4}' tfgnombreyfecha.txt | while read -r date username; do
        result=$(ldap_query "$username")
        
        echo "$date $result" >> "resultados.txt"
done < "tfgnombreyfecha.txt"
