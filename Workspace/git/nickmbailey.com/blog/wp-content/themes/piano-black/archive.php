<?php get_header(); ?>
<?php $options = get_option('pb_options'); ?>

  <div id="middle-contents" class="clearfix">

   <div id="left-col">

<?php if (have_posts()) : ?>
<div class="common-navi-wrapper">
<?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
 <?php if (is_category()) { ?>
 <p><?php printf(__('Archive for the &#8216;%s&#8217; Category', 'piano-black'), single_cat_title('', false)); ?></p>
 
 <?php } elseif( is_tag() ) { ?>
 <p><?php printf(__('Posts Tagged &#8216;%s&#8217;', 'piano-black'), single_tag_title('', false) ); ?></p>

 <?php } elseif (is_day()) { ?>
 <p><?php printf(__('Archive for %s', 'piano-black'), get_the_time(__('F jS, Y', 'piano-black'))); ?></p>

 <?php } elseif (is_month()) { ?>
 <p><?php printf(__('Archive for %s', 'piano-black'), get_the_time(__('F, Y', 'piano-black'))); ?></p>

 <?php } elseif (is_year()) { ?>
 <p><?php printf(__('Archive for %s', 'piano-black'), get_the_time(__('Y', 'piano-black'))); ?></p>

 <?php } elseif (is_author()) { ?>
 <p><?php _e('Author Archive', 'piano-black'); ?></p>

 <?php } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
 <p><?php _e('Blog Archives', 'piano-black'); ?></p>
<?php } ?>
</div>

<?php while ( have_posts() ) : the_post(); ?>

    <div class="post">
     <h2><a href="<?php the_permalink() ?>"><?php the_title(); ?></a></h2>
     <ul class="post-info">
      <li><?php the_time(__('F jS, Y', 'piano-black')) ?></li>
      <?php if ($options['author']) : ?><li><?php _e('By ','piano-black'); ?><?php the_author_posts_link(); ?></li><?php endif; ?>
      <li class="write-comment"><a href="<?php the_permalink() ?>#comments"><?php _e('Write comment','piano-black'); ?></a></li>
      <?php edit_post_link(__('[ EDIT ]', 'piano-black'), '<li class="post-edit">', '</li>' ); ?>
     </ul>
     <div class="post-content">
       <?php the_content(__('Read more', 'piano-black')); ?>
       <?php wp_link_pages(); ?>
     </div>
    </div>
    <div class="post-meta">
     <ul class="clearfix">
      <?php if($options['post_meta_type'] == 'category') { ?>
      <li class="post-category"><?php the_category(' . '); ?></li>
      <?php } else { ?>
      <?php the_tags('<li class="post-tag">', ' . ', '</li>'); ?>
      <?php } ?>
      <li class="post-comment"><?php comments_popup_link(__('Write comment', 'piano-black'), __('1 comment', 'piano-black'), __('% comments', 'piano-black')); ?></li>
     </ul>
    </div>

<?php endwhile; else: ?>
<div class="common-navi-wrapper">
  <p><?php _e("Sorry, but you are looking for something that isn't here.","piano-black"); ?></p>
</div>
<?php endif; ?>

<?php if (function_exists('wp_pagenavi')) { wp_pagenavi(); } else { include('navigation.php'); } ?>

<a href="#pngfix-right" id="back-top"><?php _e('Return top','piano-black'); ?></a>

   </div><!-- #left-col end -->

   <?php get_sidebar(); ?>

  </div><!-- #middle-contents end -->

<?php get_footer(); ?>