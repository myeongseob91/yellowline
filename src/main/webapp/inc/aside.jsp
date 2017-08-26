<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>
    //�ϸ�ũ
    function CreateBookmarkLink(url, title) {
        if (window.sidebar && window.sidebar.addPanel) {   // FF ver 23 ����.
            window.sidebar.addPanel(title, url, '');
        } else {
            if (window.external && ('AddFavorite' in window.external)) {    // IE
                window.external.AddFavorite(url, title);
            } else {    // Others
                alert('Ȯ���� Ŭ���Ͻ� �� �ּ�â���� <Ctrl+D>�� �����ø� ���ã�⿡ ��ϵ˴ϴ�.');
            }
        }
    }
    //�������� ���̾� ���ݱ�
    function asideLayer(name) {
        var target = jQuery('#'+name);
        if(target.is(':visible')) {
            target.animate({'right':-271},{'complete':function(){
                target.hide();
            }});
        } else {
            target.show();
            if(name == 'aside_searchform') {
                target.animate({'right':17});
            } else {
                target.animate({'right':0});
            }

        }
    }
    
</script>
    
    
      <div id="aside">
        <div class="side_inner">

          <div class="menu">

            <div class="group">
              <a href="#" class="icon_bookmark" onclick="CreateBookmarkLink('http://localhost:8080', '������ �ֹ����ϴ� Ȩ��'); return false;" alt="BOOKMARK+" title="BOOKMARK+"><span class="txt">���ã��</span></a>
            </div>
            <div class="group">
              <a href="#" class="icon_cate" onclick="asideLayer('layer_cate'); return false;"><span class="txt">ī�װ�</span></a>
            </div>
            <div class="group">
              <a class="icon_search" onclick="asideLayer('aside_searchform'); return false;"><span class="txt">�˻�</span></a>
              <div id="aside_searchform" class="searchform">
                <form action="http://www.lylon.co.kr/shop/shopbrand.html" method="post" name="search">
                  <span class="layer_close" onclick="asideLayer('aside_searchform');"></span>
                  <div class="box_input">
                    <input type="text" name="search" value="" class="MS_search_word" onfocus="this.style.background='#fff'" onkeydown="CheckKey_search();">
                    <a href="javascript:search_submit();" class="btn_search"><img src="http://www.lylon.co.kr/design/jjh9831/170720_renew/icon/search_btn.gif"></a>
                  </div>
                </form>
              </div>




            </div>
            <div class="group">

              <a href="/shop/basket.html" class="icon_cart"><span class="txt">��ٱ���</span></a>
            </div>
            <div class="group">
              <a href="http://www.lylon.co.kr/board/board.html?code=jjh9831_board6" class="icon_cs"><span class="txt">������</span></a>
            </div>
          </div>
          <div class="bottom_ui">
            <div class="scroll">
              <span class="btn_scroll top" onclick="winScroll('top');"></span>
              <span class="btn_scroll bottom" onclick="winScroll('bottom');"></span>
            </div>
            <!--	<div class="toggle">
				<div class="close" onclick="asideToggle();">CLOSE</div>
				<div class="open" onclick="asideToggle();">OPEN</div>
			</div> -->
          </div>
        </div>
        <!-- ī�װ� innner -->
        <div id="layer_cate" class="aside_layer">
          <div class="layer_inner">
            <span class="layer_close" onclick="asideLayer('layer_cate'); return false;"><em class="txt_clip"></em></span>
            <a href="/" class="layer_logo"><img src="http://www.lylon.co.kr/design/jjh9831/170720_renew/cate_logo.gif" alt="lylon"></a>

            <h3 class="title">CATEGORY</h3>
            <ul class="list_cate">
              <li><a href="/shop/shopbrand.html?xcode=070&amp;type=Y">NEW 5% DC</a></li>
              <li><a href="/shop/shopbrand.html?xcode=073&amp;type=N&amp;mcode=001">BEST 50</a></li>
              <li><a href="/shop/shopbrand.html?xcode=034&amp;type=Y">TODAY</a></li>

            </ul>
            <ul class="list_cate">
              <li><a href="/shop/shopbrand.html?xcode=053&amp;type=Y">OUTER</a></li>
              <li><a href="/shop/shopbrand.html?xcode=064&amp;type=Y">TOP</a></li>
              <li><a href="/shop/shopbrand.html?xcode=061&amp;type=Y">BOTTOM</a></li>
              <li><a href="/shop/shopbrand.html?xcode=062&amp;type=Y">DRESS</a></li>
              <li><a href="/shop/shopbrand.html?xcode=071&amp;type=Y">SHIRTS</a></li>
              <li><a href="/shop/shopbrand.html?xcode=060&amp;type=Y">TRANING</a></li>
              <li><a href="/shop/shopbrand.html?xcode=059&amp;type=Y">LEGGINGS</a></li>
              <li><a href="/shop/shopbrand.html?xcode=058&amp;type=Y">SHOES</a></li>
              <li><a href="/shop/shopbrand.html?xcode=057&amp;type=Y">BAG</a></li>
              <li><a href="/shop/shopbrand.html?xcode=054&amp;type=Y">ACC</a></li>
              <li><a href="/shop/shopbrand.html?xcode=031&amp;type=X">SALE</a></li>
            </ul>

            <ul class="list_cate">
              <li><a href="/shop/shopbrand.html?xcode=036&amp;type=Y">HOOD&amp;MTM</a></li>
              <li><a href="/shop/shopbrand.html?xcode=035&amp;mcode=001&amp;type=Y">DISNEY</a></li>
              <li><a href="/shop/shopbrand.html?xcode=038&amp;type=Y">BANDING COLLECTION</a></li>
            </ul>
            <h3 class="title">BOARD</h3>
            <ul class="list_cate vision_row thing">
              <li><a href="/board/board.html?code=jjh9831_board1">��������</a></li>
              <li><a onclick="javascript:window.open('/html/unpaymentlist.html','','width=540, height=500,statusbar=no,scrollbars=no');" href="#">��Ȯ���Ա���</a></li>
              <li><a href="/board/board.html?code=jjh9831_board6">Q&amp;A</a></li>
              <li><a href="/shop/shopbrand.html?xcode=011&amp;type=O">���ΰ���â</a></li>
              <li><a href="/board/board.html?code=jjh9831_board2">��ǰ�ı�</a></li>
              <li><a href="/shop/shopbrand.html?xcode=013&amp;mcode=001&amp;type=Y">�԰�����</a></li>
              <li><a href="/board/board.html?code=jjh9831_image2">�̺�Ʈ</a></li>
              <li><a href="http://service.epost.go.kr/iservice/trace/Trace.jsp" target="_blank">�����ġ��ȸ</a></li>
              <li><a href="javascript:popup_personal();" alt="1:1����" title="1:1����">1:1�Խ���</a></li>
              <li><a href="http://www.lylon.co.kr/board/board.html?code=jjh9831_board6">������</a></li>


            </ul>


            <ul class="list_cate vision_facebook thing">
              <li><a href="https://www.facebook.com/���Ϸ�-1565267377134140/?ref=bookmarks" target="_blank"><img src="http://www.lylon.co.kr/design/jjh9831/170720_renew/icon/facebook_icon.gif"></a></li>
              <li><a href="http://story.kakao.com/ch/lylon" target="_blank"><img src="http://www.lylon.co.kr/design/jjh9831/170720_renew/icon/kakao_icon.gif"></a></li>
              <li><a href="https://www.instagram.com/lylon_official" target="_blank"><img src="http://www.lylon.co.kr/design/jjh9831/170720_renew/icon/insta_icon.gif"></a></li>
            </ul>
          </div>
        </div>
        <!-- //ī�װ� inner -->

      </div>