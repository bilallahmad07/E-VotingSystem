
function funp() {
    
    st = document.getElementById("states");
    state = st.value;
    xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "getConstituency.jsp?state=" + state, true);
    xmlhttp.send(null);
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4) {
            var arr = [];
            var res = xmlhttp.responseText;
            var length = res.length;
            res = res.substring(3,length);
            arr = res.split(",", 100);
            c = document.getElementById("consti");
            c.innerHTML = "<option value='' selected='selected'>---select---</option>"
            i = 0;
            while (i < arr.length - 1) {
                var x = "<option name='" + arr[i] + "' value='" + arr[i] + "'>" + arr[i] + "</option>";
                c.innerHTML = c.innerHTML + x;
                
                i = i + 1;
            }
            
        }
    };
}
        