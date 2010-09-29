<?php
/*
Template Name: No sidebar,No page info
*/
?>
<?php get_header(); ?>
  <div id="no-side" class="clearfix">

<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>

    <div class="post" id="single">
     <h2><?php the_title(); ?></h2>
     <div class="post-content">
       <?php the_content(__('Read more', 'piano-black')); ?>
       <?php wp_link_pages(); ?>
     </div>
    </div>

<?php endwhile; else: ?>
    <div class="post-content">
      <p><?php _e("Sorry, but you are looking for something that isn't here.","piano-black"); ?></p>
    </div>
<?php endif; ?>

<?php if (function_exists('wp_list_comments')) { comments_template('', true); } else { comments_template(); } ?>

  </div><!-- #middle-contents end -->

  <div id="footer-noside">
  </div>
 
 </div><!-- #contents end -->
</div><!-- #wrapper end -->

<?php $options = get_option('pb_options'); if ($options['pagetop']) : ?>
<div id="page-top">
 <a href="#pngfix-right"></a>
</div>
<?php endif; ?>

<script type="text/javascript">
	var menu=new menu.dd("menu");
	menu.init("menu","menuhover");
</script>

</body>
</html>
