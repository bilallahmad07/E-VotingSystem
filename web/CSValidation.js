function chkdetail() {
    var a, res1, adh, type, bio;
    adh = document.getElementById("adhar").value;
    type = document.getElementById("logintype").value;
    bio = document.getElementById("biometric").value;
    a = /\d{12}$/;
    //res1=a.test(adh);
    if ((adh == "") || (type == "") || (bio == ""))//||(res1!=true))
    {
        alert("Enter Your information Correctly!");
        return false;
    }
    else
    {

        return true;
    }
}

function prReset() {

    if (confirm("Do you want to reset!"))
        return true;
    else
        return false;
}
