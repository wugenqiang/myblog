<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}{% if theme.footer.beian.enable %}{#
#}  {{ next_url('http://www.miitbeian.gov.cn', theme.footer.beian.icp + ' ') }}{#
#}{% endif %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} – {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love" id="animate">
    <i class="fa fa-{{ theme.footer.icon.name }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || author }}</span>

  {% if config.symbols_count_time.total_symbols %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.count_total') + __('symbol.colon') }}</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.count_total') }}">{#
    #}{{ symbolsCountTotal(site) }}{#
  #}</span>
  {% endif %}

  {% if config.symbols_count_time.total_time %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-coffee"></i>
    </span>
    {% if theme.symbols_count_time.item_text_total %}
      <span class="post-meta-item-text">{{ __('symbols_count_time.time_total')}} &asymp;</span>
    {% endif %}
    <span title="{{ __('symbols_count_time.time_total') }}">{#
    #}{{ symbolsTimeTotal(site, theme.symbols_count_time.awl, theme.symbols_count_time.wpm, __('symbols_count_time.time_minutes')) }}{#
  #}</span>
  {% endif %}
</div>

{% if theme.footer.powered.enable %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', next_url('https://hexo.io', 'Hexo', {class: 'theme-link'})) }}{#
  #}{% if theme.footer.powered.version %} v{{ hexo_env('version') }}{% endif %}{#
 #}</div>
{% endif %}

{% if theme.footer.powered.enable and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} – {{ next_url('https://theme-next.org', 'NexT.' + theme.scheme, {class: 'theme-link'}) }}{#
  #}{% if theme.footer.theme.version %} v{{ version }}{% endif %}{#
#}</div>
{% endif %}

{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}

<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/clicklove.js"></script>
<!-- 样式二（飘动的彩带） -->
<script type="text/javascript" src="/js/src/piaodai.js"></script>
<script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>

<!-- 先引入样式 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script> -->
<script src="./js/src/jquery.min.js"></script>
<!-- 引入Valine -->
<!-- https://unpkg.com/valine/dist/Valine.min.js -->
<script src="./js/src/Valine.min.js"></script>

<!-- 评论框美化 -->
<style>
    #comments .veditor{
        min-height: 10rem;
        background-image: url(https://gitee.com/wugenqiang/PictureBed/raw/master/CS-Notes/20200425091751.png);
        background-size: contain;
        background-repeat: no-repeat;
        background-position: right;
        background-color: rgba(255,255,255,0);
        resize: none;}
</style>

<script>
    //   自定义邮箱审核规则
    document.body.addEventListener('click', function(e) {
        if (e.target.classList.contains('vsubmit')) {
            const email = document.querySelector('input[type=email]');
            const nick = document.querySelector('input[name=nick]');
            const reg = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if (!email.value || !nick.value || !reg.test(email.value)) {
                const str = `<div class="valert text-center"><div class="vtext">请填写正确的昵称和邮箱！</div></div>`;
                const vmark = document.querySelector('.vmark');
                vmark.innerHTML = str;
                vmark.style.display = 'block';
                setTimeout(function() {
                    vmark.style.display = 'none';
                    vmark.innerHTML = '';
                }, 2500);
            }
        }
    });
    // 点击回复直接评论,官方版本点击回复时都是跳回到页面上方的评论框进行回复，评论框是固定不动的
    // 参考https://immmmm.com/valine-diy,用到jQuery
    $(document).ready(function(){
        //$('.vemoji-btn').text('😀');
        $("#vcomments").on('click', 'span.vat',function(){
            $(this).parent('div.vmeta').next("div.vcontent").after($("div.vwrap"));
            $('textarea#veditor').focus();
        })
    })
</script>

<div>
<!-- 网站运行时间的设置 -->
<span id="timeDate">载入天数...</span>
<span id="times">载入时分秒...</span>  Sometimes your whole life boils down to one insame move.
<script>
    var now = new Date();
    function createtime() {
        var grt= new Date("03/09/2019 13:14:21");//此处修改你的建站时间或者网站上线时间
        now.setTime(now.getTime()+250);
        days = (now - grt ) / 1000 / 60 / 60 / 24; dnum = Math.floor(days);
        hours = (now - grt ) / 1000 / 60 / 60 - (24 * dnum); hnum = Math.floor(hours);
        if(String(hnum).length ==1 ){hnum = "0" + hnum;} minutes = (now - grt ) / 1000 /60 - (24 * 60 * dnum) - (60 * hnum);
        mnum = Math.floor(minutes); if(String(mnum).length ==1 ){mnum = "0" + mnum;}
        seconds = (now - grt ) / 1000 - (24 * 60 * 60 * dnum) - (60 * 60 * hnum) - (60 * mnum);
        snum = Math.round(seconds); if(String(snum).length ==1 ){snum = "0" + snum;}
        document.getElementById("timeDate").innerHTML = "本站已安全运行 "+dnum+" 天 ";
        document.getElementById("times").innerHTML = hnum + " 小时 " + mnum + " 分 " + snum + " 秒";
    }
setInterval("createtime()",250);
</script>
</div>
<!-- 网站底部字数统计 -->
<div class="theme-info">
  <i class="fa fa-pencil"></i>
  <span class="post-count">博客全站共 {{ totalcount(site) }} 字</span>
</div>

<!-- 不蒜字统计 -->
<div>
	<i class="fa fa-user-md"></i>
	<span id="busuanzi_container_site_uv">
    本站访客数 <span id="busuanzi_value_site_uv"></span> 人次
  </span>&nbsp;|&nbsp;

	<i class="fa fa-eye"></i>
	<span id="busuanzi_container_site_pv">
      本站总访问量 <span id="busuanzi_value_site_pv"></span> 次
  </span>
</div>
