<script>

function maincheck(ck) // ck=> true, false
{   	
    var len=document.getElementsByClassName("subchk").length;
    if(ck)  // main이 체크가 되면
    {  // class='subchk'를 checked속성을 true
	    for(i=0;i<len;i++)
	    {
	 	   document.getElementsByClassName("subchk")[i].checked=true;
	    }	   
    }	 
    else
    {
	    for(i=0;i<len;i++)
	    {
		    document.getElementsByClassName("subchk")[i].checked=false;
	    }
    }	    
}

function subcheck()
{	
    var chk=0;
    // 체크박스의 항목이 전부 체크 되었느냐를 확인
    var len=document.getElementsByClassName("subchk").length;
    // 하나씩 체크하기
    for(i=0;i<len;i++)
    {
	    if(document.getElementsByClassName("subchk")[i].checked) chk++;
    }	
   
    if(chk==len)
    {
	    document.getElementById("mainchk").checked=true;
    }	
    else
    {
	    document.getElementById("mainchk").checked=false;
    }	   
}

</script>