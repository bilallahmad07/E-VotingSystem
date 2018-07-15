function fun1(a)
    {
        var b=document.getElementById("lw21");
        b.style.backgroundColor=a;
    }

function res()
    {
	return confirm("Are you Sure you want to Reset!");
    }
    
    function checkvoterentry()
    {
        var m=0;
        var res1,res2,res3,res4,res5,s="";
        var x=/\w+@\w+(\.\w+)+$/;
        var y=/\d{10}$/;
        var z=/\d{12}$/;
        var p=/\d{6}$/;
        res1=x.test(document.getElementById("emailid").value);
        res2=y.test(document.getElementById("mobile").value);
        res3=z.test(document.getElementById("biometric").value);
        res4=z.test(document.getElementById("adhar").value);
        res5=p.test(document.getElementById("pin").value);
                if((document.getElementById("tele").value)!=""){
                    if((y.test(document.getElementById("tele").value))!=true){
                        m=1;
                        s+="Not a Valid TelePhone number"+"\n";
                    }
                }
	if(res1!=true)
        {
	m=1;
        s+="Not a Valid Email Id"+"\n";
    }
        if(res2!=true)
        {
	m=1;
        s+="Not a Valid Mobile number"+"\n";
    }
        if(res3!=true)
        {
	m=1;
        s+="Please take Biometric again"+"\n";
    }
    if(res4!=true)
        {
	m=1;
        s+="Not a valid Adhar Number!"+"\n";
    }
    if(res5!=true)
        {
	m=1;
        s+="Not a Valid PinCode"+"\n";
    }
        if(m==1)
	{
            alert(s);
            return false;
	}
	if(m==0)
            return true;
    
    
	//if((document.getElementById("epic").value==="")||(document.getElementById("tele").value==="")||(document.getElementById("emailid").value==="")||(document.getElementById("password").value==="")||(document.getElementById("password2").value===""))
        //{
          //  s="Enter Mandatory Feilds"+"\n";
            //m=1;
        //}
        //if((document.getElementById("emailid").value==="")||(res!==true))
        //{
//            s+="Enter Valid EmailId"+"\n";
//            m=1;
//        }
//        if((document.getElementById("password1").value)!==(document.getElementById("password2").value))
//        {
//            s+="Password does not match"+"\n";
  //          m=1;
    //    }
	//if(m===1)
	//{
	//alert(s);
	//return false;
	//}
	//else return true;
} 


