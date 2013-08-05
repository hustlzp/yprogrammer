/* Follow or disfollow a node by Ajax
 *
 * method ajax_follow_node
 * @param url: ajax url
 * @param n_id: node id
 * @param success: callback when success
 */
function ajax_follow_node(url, n_id, success){
   $.ajax({
      url: url,
      method: 'POST',
      data: { 'n_id': n_id },
      success: function(result){
         if(result === 'success'){
            success();
         }
         else if(result === 'unlogin'){
            window.location = "/";
         }
      }
   });
}

/* Collect or discollect a resource by Ajax
 *
 * method ajax_collect_resource
 * @param url: ajax url
 * @param r_id: resource id
 * @param success: callback when success
 */
function ajax_collect_resource(url, r_id, success){
   $.ajax({
      url: url,
      method: 'POST',
      data: { 'r_id': r_id },
      success: function(result){
         if(result === 'success'){
            success();
         }
         else if(result === 'unlogin'){
            window.location = "/";
         }
      }
   });
}