function saveValues() {
    var frm = document.form1;

    var record = ""
            +       frm.text1.value
            + "," + frm.text2.value
            + "," + frm.text3.value
            + "\n";

    frm.textarea1.value += record;
}

function clearText() {
    document.form1.textarea1.value = "";
}