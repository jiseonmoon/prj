function submitcheck(event){
		console.log("체크합니다.");
		if(!$('.panel-heading:eq(0)').hasClass('check') || !$('.panel-heading:eq(1)').hasClass('check') || !$('.panel-heading:eq(2)').hasClass('check')){
			console.log("1번");
		
			$('.nav-tabs').children('li').removeClass('active');
			$('#first').removeClass('active');
			$('#second').removeClass('active');
			$('#third').removeClass('active');
			$('#first').removeClass('show');
			$('#second').removeClass('show');
			$('#third').removeClass('show');
			$('#first').addClass('active show');
			$('.nav-tabs').children().eq(0).addClass('active');
		}
		else{
			console.log("두번째");
			if(!$('.panel-heading:eq(3)').hasClass('check') || !$('.panel-heading:eq(4)').hasClass('check') || !$('.panel-heading:eq(5)').hasClass('check')){
			
				$('.nav-tabs').children('li').removeClass('active');
				$('#first').removeClass('active');
				$('#second').removeClass('active');
				$('#third').removeClass('active');
				$('#first').removeClass('show');
				$('#second').removeClass('show');
				$('#third').removeClass('show');
				$('#second').addClass('active show');
				$('.nav-tabs').children().eq(1).addClass('active');	
			}else{
				if(!$('.panel-heading:eq(6)').hasClass('check') || !$('.panel-heading:eq(7)').hasClass('check')){
				
					$('.nav-tabs').children('li').removeClass('active');
					$('#first').removeClass('active');
					$('#second').removeClass('active');
					$('#third').removeClass('active');
					$('#first').removeClass('show');
					$('#second').removeClass('show');
					$('#third').removeClass('show');
					$('#third').addClass('active show');
					$('.nav-tabs').children().eq(2).addClass('active');	
			}else{
				document.frm.submit();
			}
		}
		}
	}

	$(function(){
		$('#check1').on('click', function(){
			console.log("클릭");
			if($('#stitle').val() != null && $('#stitle').val()!=""){
				$('.panel-heading:eq(0)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(0)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"  aria-expanded="false" class="collapsed"><span class="glyphicon glyphicon-ok"> </span> '+$('#stitle').val() + "</a>");
				$('.panel-heading:eq(0)').addClass('check');
				$('.panel-heading:eq(0) ~ div').collapse('hide');
				$('.panel-heading:eq(0) ~ div').removeClass('show');
				$('.panel-heading:eq(0) ~ div').removeClass('in');
				$('.panel-heading:eq(1) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(0)').hasClass('check')){
					$('.panel-heading:eq(0)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true">'+'<span>제목을 입력해주세요.</span>'+'</a>');
					$('.panel-heading:eq(0)').removeClass('check');
					$('.panel-heading:eq(0)').children('span').remove();
					$('.panel-heading:eq(0) ~ div').removeClass('show');
					$('.panel-heading:eq(0) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(0)').css('background-image', 'none').css('background-color', 'orange');
			}
					
		})
		$('#check2').on('click', function(){
			console.log("클릭");
			if($('#scontent').val() != null && $('#scontent').val()!=""){
				$('.panel-heading:eq(1)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(1)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="glyphicon glyphicon-ok"> </span> '+ ' 내용이 입력되었습니다.'+"</a>");
				$('.panel-heading:eq(1)').addClass('check');
				$('.panel-heading:eq(1) ~ div').collapse('hide');
				$('.panel-heading:eq(1) ~ div').removeClass('show');
				$('.panel-heading:eq(1) ~ div').removeClass('in');
				$('.panel-heading:eq(2) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(1)').hasClass('check')){
					$('.panel-heading:eq(1)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">'+"내용을 입력해주세요."+'</a>');
					$('.panel-heading:eq(1)').removeClass('check');
					$('.panel-heading:eq(1)').children('span').remove();
					$('.panel-heading:eq(1) ~ div').removeClass('show');
					$('.panel-heading:eq(1) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(1)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check3').on('click', function(){
			console.log("클릭");
			if($('#tag').val() != null && $('#tag').val()!=""){
				$('.panel-heading:eq(2)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(2)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree"><span class="glyphicon glyphicon-ok"> </span> '+ $('#tag').val()+'</a>');
				$('.panel-heading:eq(2)').addClass('check');
				$('.panel-heading:eq(2) ~ div').collapse('hide');
			}else{
				if($('.panel-heading:eq(2)').hasClass('check')){
					$('.panel-heading:eq(2)').html('<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">'+'태그가 선택되지 않았습니다.'+"</a>");
					$('.panel-heading:eq(2)').removeClass('check');
					$('.panel-heading:eq(2)').children('span').remove();
					$('.panel-heading:eq(2) ~ div').removeClass('show');
					$('.panel-heading:eq(2) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(2)').css('background-image', 'none').css('background-color', 'orange');
			}
		})
		$('#check4').on('click', function(){
			console.log("클릭");
			if($('#imgpath').val() != null && $('#imgpath').val()!=""){
				$('.panel-heading:eq(3)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(3)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2"><span class="glyphicon glyphicon-ok"> </span> '+" 이미지를 업로드 했습니다." + "</a>");
				$('.panel-heading:eq(3)').addClass('check');
				$('.panel-heading:eq(3) ~ div').collapse('hide');
				$('.panel-heading:eq(3) ~ div').removeClass('show');
				$('.panel-heading:eq(3) ~ div').removeClass('in');
				$('.panel-heading:eq(4) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(3)').hasClass('check')){
					$('.panel-heading:eq(3)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2">'+' 이미지를 올려주세요.'+'</a>');
					$('.panel-heading:eq(3)').removeClass('check');
					$('.panel-heading:eq(3)').children('span').remove();
					$('.panel-heading:eq(3) ~ div').removeClass('show');
					$('.panel-heading:eq(3) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(3)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check5').on('click', function(){
			console.log("클릭");
			if($('#destmoney').val() != null && $('#destmoney').val()!="" && $('#destmoney').val()!=0){
				$('.panel-heading:eq(4)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(4)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2"><span class="glyphicon glyphicon-ok"> </span> '+'목표 금액 : ' + $('#destmoney').val()+"만원" + "</a>");
				$('.panel-heading:eq(4)').addClass('check');
				$('.panel-heading:eq(4) ~ div').collapse('hide');
				$('.panel-heading:eq(4) ~ div').removeClass('show');
				$('.panel-heading:eq(4) ~ div').removeClass('in');
				$('.panel-heading:eq(5) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(4)').hasClass('check')){
					$('.panel-heading:eq(4)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo2">'+' 목표 금액을 설정해주세요.'+'</a>');
					$('.panel-heading:eq(4)').removeClass('check');
					$('.panel-heading:eq(4)').children('span').remove();
					$('.panel-heading:eq(4) ~ div').removeClass('show');
					$('.panel-heading:eq(4) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(4)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check6').on('click', function(){
			console.log("클릭");
			if($('#minmoney').val() != null && $('#minmoney').val()!="" && $('#minmoney').val()!=0){
				$('.panel-heading:eq(5)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(5)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2"><span class="glyphicon glyphicon-ok"> </span> '+'최소 후원 금액 : ' + $('#minmoney').val()+"만원" + "</a>");
				$('.panel-heading:eq(5)').addClass('check');
				$('.panel-heading:eq(5) ~ div').collapse('hide');
				$('.panel-heading:eq(5) ~ div').removeClass('show');
				$('.panel-heading:eq(5) ~ div').removeClass('in');
				$('.panel-heading:eq(6) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(5)').hasClass('check')){
					$('.panel-heading:eq(5)').html('<a data-toggle="collapse" data-parent="#accordion2" href="#collapseThree2">'+' 최소 후원 금액을 설정해주세요.'+'</a>');
					$('.panel-heading:eq(5)').removeClass('check');
					$('.panel-heading:eq(5)').children('span').remove();
					$('.panel-heading:eq(5) ~ div').removeClass('show');
					$('.panel-heading:eq(5) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(5)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check7').on('click', function(){
			console.log("클릭");
			if($('#finaldate').val() != null && $('#finaldate').val()!=""){
				$('.panel-heading:eq(6)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(6)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3"><span class="glyphicon glyphicon-ok"> </span> '+'마감일 : ' + $('#finaldate').val()+ "</a>");
				$('.panel-heading:eq(6)').addClass('check');
				$('.panel-heading:eq(6) ~ div').collapse('hide');
				$('.panel-heading:eq(6) ~ div').removeClass('show');
				$('.panel-heading:eq(6) ~ div').removeClass('in');
				$('.panel-heading:eq(7) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(6)').hasClass('check')){
					$('.panel-heading:eq(6)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3">'+' 마감일을 선택해주세요.'+'</a>');
					$('.panel-heading:eq(6)').removeClass('check');
					$('.panel-heading:eq(6)').children('span').remove();
					$('.panel-heading:eq(6) ~ div').removeClass('show');
					$('.panel-heading:eq(6) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(6)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#check8').on('click', function(){
			console.log("클릭");
			if($('#bankno').val() != null && $('#bankno').val()!=""){
				$('.panel-heading:eq(7)').css('background-image', 'none').css('background-color', 'lightblue');
				$('.panel-heading:eq(7)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3"><span class="glyphicon glyphicon-ok"> </span> '+'계좌 번호 : ' + $('#bankno').val()+ "</a>");
				$('.panel-heading:eq(7)').addClass('check');
				$('.panel-heading:eq(7) ~ div').collapse('hide');
				$('.panel-heading:eq(7) ~ div').removeClass('show');
				$('.panel-heading:eq(7) ~ div').removeClass('in');
				$('.panel-heading:eq(8) ~ div').collapse('show');
			}else{
				if($('.panel-heading:eq(7)').hasClass('check')){
					$('.panel-heading:eq(7)').html('<a data-toggle="collapse" data-parent="#accordion3" href="#collapseTwo3">'+' 계좌를 입력해주세요.'+'</a>');
					$('.panel-heading:eq(7)').removeClass('check');
					$('.panel-heading:eq(7)').children('span').remove();
					$('.panel-heading:eq(7) ~ div').removeClass('show');
					$('.panel-heading:eq(7) ~ div').removeClass('in');
				}
				$('.panel-heading:eq(7)').css('background-image', 'none').css('background-color', 'orange');
			}
			
		})
		$('#atitle').on('mouseover', function(){
			$('#atitle').popover('show');
		})
		$('#atitle').on('mouseout', function(){
			$('#atitle').popover('hide');
		})
		$('#acontent').on('mouseover', function(){
			$('#acontent').popover('show');
		})
		$('#acontent').on('mouseout', function(){
			$('#acontent').popover('hide');
		})
		$('#atag').on('mouseover', function(){
			$('#atag').popover('show');
		})
		$('#atag').on('mouseout', function(){
			$('#atag').popover('hide');
		})
		$('#aimg').on('mouseover', function(){
			$('#aimg').popover('show');
		})
		$('#aimg').on('mouseout', function(){
			$('#aimg').popover('hide');
		})
		$('#adm').on('mouseover', function(){
			$('#adm').popover('show');
		})
		$('#adm').on('mouseout', function(){
			$('#adm').popover('hide');
		})
		$('#amm').on('mouseover', function(){
			$('#amm').popover('show');
		})
		$('#amm').on('mouseout', function(){
			$('#amm').popover('hide');
		})
		$('#afd').on('mouseover', function(){
			$('#afd').popover('show');
		})
		$('#afd').on('mouseout', function(){
			$('#afd').popover('hide');
		})
		$('#abn').on('mouseover', function(){
			$('#abn').popover('show');
		})
		$('#abn').on('mouseout', function(){
			$('#abn').popover('hide');
		})
		
	})