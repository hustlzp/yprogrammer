{% load is_followed from resource_tags %}

<script type="text/javascript">
$(function(){
   $('.btn-follow, .btn-disfollow').click(function(){
      var n_id = $(this).data('node-id');
      
      if($(this).hasClass('btn-follow')){
         var url = "{% url 'follow_node' %}";
      } else {
         var url = "{% url 'disfollow_node' %}";
      }

      var btn_follow = $(this);

      $.ajax({
         url: url,
         method: 'POST',
         data: { 'n_id': n_id },
         success: function(result){
            if(result === 'success'){
               if($(btn_follow).hasClass('btn-follow')){
                  $(btn_follow).parent().addClass('on');
               } else {
                  $(btn_follow).parent().removeClass('on');
               }               
            }
            else if(result === 'unlogin'){
               window.location = "{% url 'index' %}";
            }
         }
      });
   });
});
</script>

{% for nt in node_types %}
<div class='node-type-item clearfix'>
   <div class='node-type'>{{ nt.type }}</div>
   <ul class='nodes'>
      {% for n in nt.node_set.all %}
      <li class='media'>
         <a href="{% url 'node' n.id %}" class='pull-left'>
            <img class='node-image media-object' src="{{ n.image_url }}">
         </a>

         <div class='media-body'>
            <h4 class='media-heading'>
               <a href="{% url 'node' n.id %}" >{{ n.title }}</a>
            </h4>

            <div class='node-desc'>{{ n.desc }}</div>
            
            <div class='follow-container {% if n|is_followed:request.session.user_id %}on{% endif %}'>
               <a class="btn btn-mini btn-follow" data-node-id={{ n.id }} title='关注'><i class='icon-ok'></i></a>
               <a class="btn btn-mini btn-primary btn-disfollow" data-node-id={{ n.id }} title='取消关注'><i class='icon-ok'></i></a>
            </div>
         </div>
      </li>
      {% endfor %}
   </ul>
</div>
{% endfor %}