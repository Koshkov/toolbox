function filter(data,param){
	let list = document.getElementsByTagName('table');
	var category = document.getElementById(param).value;
	if(category !== "") {
		for(let i=0; i < (list.length); i++) {
			(list[i].getAttribute(data) == category) ? 
				list[i].style.display = "block":
				list[i].style.display = "none";
		} 
	}else{
		for(let i=0; i < (list.length); i++) {
			list[i].style.display = "block";
		}
	}
}
