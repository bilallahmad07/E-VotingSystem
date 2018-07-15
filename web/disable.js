
function disable(a) {
   
                alert("This " + a + " section is not available right now")
                return false;
            }
            
            function res()
            {
                return confirm("Are you Sure you want to Reset!");
            }

            function check()
            {
                var m=0;
                if ((document.getElementById("states").value=="") || (document.getElementById("consti").value==""))
                {
                    alert("Enter all the Fields");
                    return false;
                }
                else{
                    return true;
                }
            }
            
       function chkadhar(){
           var a = /\d{12}$/;
           var v=(document.getElementById("adhar")).value;
           var b = a.test(v);
           if(b!=true){
               alert("Please enter the adhar number correctly!");
                return false;
            }
            else{
                return confirm("Are you sure you want to delete "+v);
            }
       }     
       
       function chkadhar2(){
           var a = /\d{12}$/;
           var v=(document.getElementById("adhar")).value;
           var b = a.test(v);
           if(b!=true){
               alert("Please enter the adhar number correctly!");
                return false;
            }
            else{
                return true;
            }
       }     
       
       function checkcandidate(){
           var m=0;
                if ((document.getElementById("states").value=="") || (document.getElementById("consti").value=="")
                        || (document.getElementById("name").value=="") || (document.getElementById("party").value==""))
                {
                    alert("Enter all the Fields");
                    return false;
                }
                else{
                    return true;
                }
            }
       