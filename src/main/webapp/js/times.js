function times(){   
    date=new Date();
    hr=date.getHours();
    min=date.getMinutes();
    sec=date.getSeconds();
    if(hr<10)
    {
        hr="0"+hr;
    }
    if(min<10)
    {
        min="0"+min;
    }
    if(sec<10)
    {
        sec="0"+sec;
    }
    if(document.getElementById('time') != null){
    	document.getElementById('time').innerHTML=hr+":"+min+":"+sec;
    	setTimeout('times()','1000');
    }
}