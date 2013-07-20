{% for nt in node_types %}
   <div class='node-type-item clearfix'>
      <div class='node-type'>{{ nt.type }}</div>
      <ul class='nodes'>
         {% for n in nt.nodes %}
         <li class='media'>
            <a href="{% url 'node' n.id %}" class='pull-left'>
               <img class='node-image media-object' src="{{ n.image_url }}">
            </a>

            <div class='media-body'>
               <h4 class='media-heading'>
                  <a href="{% url 'node' n.id %}" >{{ n.title }}</a>
               </h4>

               <div class='node-desc'>{{ n.desc }}</div>
               
               <div class='follow-container {% if n.is_followed %}on{% endif %}'>
                  <a class="btn btn-mini btn-follow" data-node-id={{ n.id }} title='关注'><i class='icon-ok'></i></a>
                  <a class="btn btn-mini btn-primary btn-disfollow" data-node-id={{ n.id }} title='取消关注'><i class='icon-ok'></i></a>
               </div>
            </div>
         </li>
         {% endfor %}
      </ul>
   </div>
{% endfor %}