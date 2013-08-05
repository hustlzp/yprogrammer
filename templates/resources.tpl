{% load resource_tags %}

<script type="text/javascript">

$(function(){
   // collect resource by Ajax
   $('.btn-collect').click(function(){
      var r_id = $(this).data('resource-id');
      var url = "{% url 'collect_resource' %}";
      var btn_collect = $(this);

      ajax_collect_resource(url, r_id, function(){
         var collect_count = $(btn_collect).nextAll('.collect-count');
         $(btn_collect).parent().addClass('on');
         collect_count.text(parseInt(collect_count.text()) + 1);
      });
   });

   // discollect resource by Ajax
   $('.btn-discollect').click(function(){
      var r_id = $(this).data('resource-id');
      var url = "{% url 'discollect_resource' %}";
      var btn_discollect = $(this);

      ajax_collect_resource(url, r_id, function(){
         var collect_count = $(btn_discollect).nextAll('.collect-count');
         $(btn_discollect).parent().removeClass('on');
         collect_count.text(parseInt(collect_count.text()) - 1);
      });
   }); 
});

</script>

{% for r in resources %}
<div class='res-item'>
   <div class="res-header">
      <img class='res-favicon' src="http://g.etfv.co/{{ r.url }}">
      <a href="{{ r.url }}" class='res-title' target='_blank'>{{ r.title }}</a>
      <small class='res-desc'>{{ r.desc }}</small>
   </div>

   <div class='res-meta'>
      <span class='meta-item'>
         <a class='res-node' href="{% url 'node' r.node.id %}" title='节点：{{ r.node.title }}'>{{ r.node.title }}</a>/<a class='res-type' href="{% url 'node' r.node.id %}?type={{ r.type.id }}" title='类型：{{ r.type }}'>{{ r.type.type }}</a>
      </span>
      <span class='meta-item'>
         <i class='icon-user'></i> <a href="{% url 'user' r.creator.name %}">{{ r.creator.name }}</a>
      </span>
<!--       <span class='meta-item'>
         <i class='icon-comment-alt'></i> <a href="{% url 'resource' r.id %}">8评论</a>
      </span> -->
      <span class='meta-item'>{{ r.create_time|ago }}前</span>
      <!-- <span class='meta-item res-thank'><i class='icon-heart-empty'></i> <a href='#'>感谢</a></span> -->
      <!-- <span class='meta-item res-thank'><i class='icon-share'></i> <a href='#'>分享</a></span> -->
   </div>

   <div class='btn-group collect-wap {% if r|is_collected:request.session.user_id %}on{% endif %}'>
      <a class="btn btn-mini btn-collect" data-resource-id='{{ r.id }}' title='添加到导航'><i class='icon-bookmark-empty'></i></a>
      <a class="btn btn-mini btn-primary btn-discollect" data-resource-id='{{ r.id }}' title='取消导航'><i class='icon-bookmark'></i></a>
      <a class='btn btn-mini collect-count'>{{ r.collect_count }}</a>
   </div>
</div>
{% endfor %}