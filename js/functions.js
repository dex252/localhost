var arr = [0, 0, 0, 0 ,9999, ""];
var currentPage = -1;// Текущее число страниц, считаем в slider-functions.js

//Каждый прогон
function changeButtons(num) //<- num-число страниц, которое необходимо выставить, для этого нужно почитсить slick-slider от currentPage страниц.
{
				//смотрим на длину полученного ответа и высылаем результат
			//$('#sliderPage').slick('slickRemove', 0);
			//$('#sliderPage').slick('unslick');
			//var lastIndex = $('#sliderPage').eq($('#sliderPage').length - 1)//ВОТ ТУТ основное - определение длины
		//	$('#sliderPage').slick('slickAdd', '<div><h3>' + 10 + '</h3></div>');
			//alert(lastIndex.id);

	//смотрим на разницу в > или < сторону по страницам, в зависимости от разницы запускаем функции добавления/удаления
	if (currentPage > num) minusSlickSlider(currentPage-num);
	else plusSlickSlider(num-currentPage);
	//приравниваем полученное число страниц к текущим
	currentPage = num;
	
	//удаляем указанное число страниц
	function minusSlickSlider(numMinus){
		
		for (var i = 1; i <= numMinus; i++) 
		{
			$('#sliderPage').slick('slickRemove', currentPage-i);
		}			
		
	}
	//добавляем указанно число страниц
	function plusSlickSlider(numPlus){
		
		for (var i = 1; i <= numPlus; i++) 
		{
			$('#sliderPage').slick('slickAdd', 
			
			'<div><div id="pageBlock'+(currentPage+i)+'" class="pageScroll" onclick="NumPage(this)";"><div class="ButtonPage" >'+(currentPage+i)+'</div></div></div>'
			
			);
		}	
	}
}

function StartSearch() {
	var name_anime=document.getElementById('searchTextInput').value;
	arr = [0, 0, 0, 0 ,9999, ""];
	if(name_anime.length>0)
	{
		arr[5] = name_anime;
	}
	else name_anime="";

	NumPage(document.getElementById('pageBlock1'));
}

//Клик по слайдеру для перелистывания
function NumPage(number){
		$currentPage=number.id.replace(/[^-0-9]/gim,'');

		$.get("http://localhost/api/api/post/read_block.php", {"ganre":arr[0], "type":arr[1], "status":arr[2], "year1":arr[3], "year2":arr[4], "name_anime":arr[5]}).done(function(data){
			
		var $main = document.getElementById('animeMainField');
		$main.innerHTML = '';
		
		i=($currentPage*12-11);
		
		while (i<($currentPage*12+1)) 
			{
				var div=document.createElement('block'+i);
				div.id = "block"+i;
				div.className = "animeBlock";
				if (data[i-1])
				{
					id_anime = data[i-1]["id_anime"]
					img_link = data[i-1]["img_link"]
					name_anime = data[i-1]['name']
					div.style.backgroundImage=("url("+img_link+")");
					
					animeMainField.appendChild(div);
					
					document.getElementById('block'+i).innerHTML += '<span">'+name_anime+'</span>';

					document.getElementById('block'+i).onclick = iSeeDeadPeople;

				}
				
				i+=1;    
	 		}
			
		//максимально возможное число страниц
		maxPage = data.length;	
		maxPage = Math.ceil(maxPage/12);
		if (currentPage != maxPage) changeButtons(maxPage);
		});
}

//показать видео по id
function iSeeDeadPeople(e){
	e = e || window.event;
    var el = e.target || e.srcElement;
	var $main = document.getElementById('animeMainField');
	$main.innerHTML = '';
	
	//номер блока
	i=el.id.replace(/[^-0-9]/gim,'');
	
	$.get("http://localhost/api/api/post/read_block.php", {"ganre":arr[0], "type":arr[1], "status":arr[2], "year1":arr[3], "year2":arr[4], "name_anime":arr[5]}).done(function(data){
		
		//возврат к предыдущему окну
		var back=document.createElement('back');
		back.id = "back";
		back.className = "Back";
		
		//добавление иконки к back'у
		var backIcon=document.createElement('div');
		backIcon.id = "BackIcon";
		backIcon.className = "BackIcon";
		
		//вставляем картинку
		var img=document.createElement('div');
		img.id = "img"+i;
		img.className = "animeImage";
		img_link = data[i-1]["img_link"]
		img.style.backgroundImage=("url("+img_link+")");
		
		var discription=document.createElement('div');
		discription.id = "txt"+i;
		discription.className = "Discription";
		
		nameText = data[i-1]["name"]
		exitStatusText = data[i-1]["id_exit_status"]
		ganreText = data[i-1]["id_ganre"] //запрос по id жанра
		yearText = data[i-1]["year"]
		authorText = data[i-1]["author"]
		videoTypeText = data[i-1]["id_video_type"]
		numSeriesText = data[i-1]["num_series"]
		discriptionText = data[i-1]["discription"]
		
		discription.innerHTML +='<p style="text-align:center;  font-weight: 600;">'+nameText+'</p>'
		discription.innerHTML +='<p>Статус: '+exitStatusText+'</p>'
		discription.innerHTML +='<p>Год: '+yearText+'</p>'
		discription.innerHTML +='<p>Жанр: '+ganreText+'</p>'
		discription.innerHTML +='<p>Автор: '+authorText+'</p>'
		discription.innerHTML +='<p>Тип: '+videoTypeText+'</p>'
		discription.innerHTML +='<p>Серии: '+numSeriesText+'</p>'
		discription.innerHTML +='<p>'+discriptionText+'</p>'
		
		var watchVideo = document.createElement('div');
		watchVideo.id = "WatchVideo";
		watchVideo.className = "watchChoseVideoText";
		watchVideo.innerHTML +='<p style="text-align:center; font-size:20px; font-weight: 600;">Смотреть видео:</p>'
		
		var video = document.createElement('div');
		//img_link = data[i-1]["img_link"] <-сюда вставить видюхи?
		video.id = "video";
		video.className = "Video";
		//video.innerHTML += '<iframe width="100%" height="400" src="http://video.sibnet.ru/shell.php?videoid=3632282" frameborder="0" scrolling="no" allowfullscreen="" wmode="window" align="middle" style="position:relative; z-index:500;"></iframe>';	
		
		video.innerHTML += '<iframe width="100%" height="400" src="http://video.sibnet.ru/shell.php?videoid=3634504" frameborder="0" scrolling="no" allowfullscreen="" wmode="window" align="middle" style="position:relative; z-index:500;"></iframe>';	

		//http://video.sibnet.ru/shell.php?videoid=3634504
		
		var choseVideo = document.createElement('div');
		choseVideo.id = "watchVideo";
		choseVideo.className = "watchChoseVideoText";
		choseVideo.innerHTML +='<p style="text-align:center; font-size:20px; font-weight: 600;">Выбрать серию:</p>'
		
		//добавляем созданные блоки в main
		animeMainField.appendChild(back);
		back.appendChild(backIcon);
		animeMainField.appendChild(img);
		animeMainField.appendChild(discription);
		animeMainField.appendChild(watchVideo);
		animeMainField.appendChild(video);
		animeMainField.appendChild(choseVideo);
		
		//функция для возврата
		$("back").click(function(){	
		
		backPage = 1;
		
		if ((i%12) != 0) 
		{
			backPage = (i/12|0)+1;
		}
		else
		{
			backPage = (i/12|0);
		}
	
		NumPage(document.getElementById('pageBlock' + backPage));
		});
	});
}

function searchVideo(e){
	
	var ganre=document.getElementById('selectGanre').selectedIndex;
	var type=document.getElementById('selectType').selectedIndex;
	var status=document.getElementById('selectStatus').selectedIndex;
	var year1=document.getElementById('year1').value;
	var year2=document.getElementById('year2').value;

	arr[0] = ganre;
	arr[1] = type;
	arr[2] = status;
	arr[5]="";
	
	if(year1.length>0)
	{
		arr[3] = year1;
	}
	else 
	{
		arr[3] = 0;
	}
	if(year2.length>0)
	{
		arr[4] = year2;
	}
	else
	{
		arr[4] = 9999;
	}
	
	NumPage(document.getElementById('pageBlock1'));
}