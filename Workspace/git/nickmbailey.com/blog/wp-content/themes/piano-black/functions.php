<?php

// Theme option

class piano_black_options {

	function getOptions() {
		$options = get_option('pb_options');
		if (!is_array($options)) {
			$options['use_logo'] = false;
			$options['show_information'] = true;
			$options['information_title'] = '';
			$options['information_contents'] = '';
			$options['header_menu_type'] = 'pages';
			$options['header_rss'] = true;
			$options['header_search'] = true;
			$options['use_google_search'] = false;
			$options['custom_search_id'] = '';
			$options['post_meta_type'] = 'category';
			$options['page_navi_type'] = 'pager';
			$options['author'] = false;
			$options['return_top'] = false;
			$options['exclude_pages'] = '';
			$options['exclude_category'] = '';
			$options['time_stamp'] = false;
			update_option('pb_options', $options);
		}
		return $options;
	}

	function update() {
		if(isset($_POST['pb_save'])) {
			$options = piano_black_options::getOptions();

			// logo
			if ($_POST['use_logo']) {
				$options['use_logo'] = (bool)true;
			} else {
				$options['use_logo'] = (bool)false;
			}
			$options['use_logo'] = stripslashes($_POST['use_logo']);

			// information
			if ($_POST['show_information']) {
				$options['show_information'] = (bool)true;
			} else {
				$options['show_information'] = (bool)false;
			}
			$options['information_title'] = stripslashes($_POST['information_title']);
			$options['information_contents'] = stripslashes($_POST['information_contents']);

			// header menu
			$options['header_menu_type'] = stripslashes($_POST['header_menu_type']);

			// exclude pages
			$options['exclude_pages'] = stripslashes($_POST['exclude_pages']);

			// exclude category
			$options['exclude_category'] = stripslashes($_POST['exclude_category']);

			// show header rss
			if ($_POST['header_rss']) {
				$options['header_rss'] = (bool)true;
			} else {
				$options['header_rss'] = (bool)false;
			}
			// show header search
			if ($_POST['header_search']) {
				$options['header_search'] = (bool)true;
			} else {
				$options['header_search'] = (bool)false;
			}
			if ($_POST['use_google_search']) {
				$options['use_google_search'] = (bool)true;
			} else {
				$options['use_google_search'] = (bool)false;
			}
			$options['custom_search_id'] = stripslashes($_POST['custom_search_id']);

			// show author
			if ($_POST['author']) {
				$options['author'] = (bool)true;
			} else {
				$options['author'] = (bool)false;
			}

			// post meta
			$options['post_meta_type'] = stripslashes($_POST['post_meta_type']);

			// show time stamp
			if ($_POST['time_stamp']) {
				$options['time_stamp'] = (bool)true;
			} else {
				$options['time_stamp'] = (bool)false;
			}

			// page navi type
			$options['page_navi_type'] = stripslashes($_POST['page_navi_type']);

			// show return top link
			if ($_POST['return_top']) {
				$options['return_top'] = (bool)true;
			} else {
				$options['return_top'] = (bool)false;
			}

			update_option('pb_options', $options);

		} else {
			piano_black_options::getOptions();
		}

		add_theme_page(__('Current Theme Options', 'piano-black'), __('Current Theme Options', 'piano-black'), 'edit_themes', basename(__FILE__), array('piano_black_options', 'display'));
	}

	function display() {
		$options = piano_black_options::getOptions();
?>

<div class="wrap">

<h2><?php _e('Piano Black Options', 'piano-black'); ?></h2>

<form method="post" action="#" enctype="multipart/form-data">

<p><?php _e('Check if you would like to use image for logo.<br />Replace your original image with pianoblack / img / logo.gif<br />Adjust position in style.css line 54', 'piano-black'); ?></p>
<p>
<input name="use_logo" type="checkbox" value="checkbox" <?php if($options['use_logo']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />

<p><?php _e('Show Information on sidebar.', 'piano-black'); ?></p>
<p>
<input name="show_information" type="checkbox" value="checkbox" <?php if($options['show_information']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />

<p><?php _e('Information title.', 'piano-black'); ?></p>
<p><input type="text" name="information_title" value="<?php echo($options['information_title']); ?>" /></p>
<br />

<p><?php _e('Information contents. ( HTML tag is available. )', 'piano-black'); ?></p>
<p><textarea name="information_contents" cols="70%" rows="5"><?php echo($options['information_contents']); ?></textarea></p>
<br />

<p><?php _e('Header menu.', 'piano-black'); ?></p>
<p>
<input name="header_menu_type" type="radio" value="pages" <?php if($options['header_menu_type'] != 'categories') echo "checked='checked'"; ?> /> <?php _e('Use pages for header menu.', 'piano-black'); ?><br />
<input name="header_menu_type" type="radio" value="categories" <?php if($options['header_menu_type'] == 'categories') echo "checked='checked'"; ?> /> <?php _e('Use categories for header menu.', 'piano-black'); ?>
</p>
<br />

<p><?php _e('Exclude Pages<br />(Page ID\'s you don\'t want displayed in your header navigation. Use a comma-delimited list, eg. 1,2,3)', 'piano-black'); ?></p>
<p><input type="text" name="exclude_pages" value="<?php echo($options['exclude_pages']); ?>" /></p>
<br />

<p><?php _e('Exclude Categories<br />(Category ID\'s you don\'t want displayed in your header navigation. Use a comma-delimited list, eg. 1,2,3)', 'piano-black'); ?></p>
<p><input type="text" name="exclude_category" value="<?php echo($options['exclude_category']); ?>" /></p>
<br />

<p><?php _e('Show rss on header.', 'piano-black'); ?></p>
<p>
<input name="header_rss" type="checkbox" value="checkbox" <?php if($options['header_rss']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />

<p><?php _e('Show search on header.', 'piano-black'); ?></p>
<p>
<input name="header_search" type="checkbox" value="checkbox" <?php if($options['header_search']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />
<p><?php _e('Use <a href="http://www.google.com/cse/">Google Custom Search</a><br />(If you check this option,don\'t forget to write your Google Custom Search ID below.)', 'piano-black'); ?></p>
<p>
<input name="use_google_search" type="checkbox" value="checkbox" <?php if($options['use_google_search']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<p><?php _e('Input your Google Custom Search ID.', 'piano-black'); ?></p>
<p>
<input type="text" name="custom_search_id" value="<?php echo($options['custom_search_id']); ?>" style="width:400px;" />
</p>
<br />


<p><?php _e('Show author.', 'piano-black'); ?></p>
<p>
<input name="author" type="checkbox" value="checkbox" <?php if($options['author']) echo "checked='checked'"; ?> /> <?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />

<p><?php _e('Post meta.', 'piano-black'); ?></p>
<p>
<input name="post_meta_type" type="radio" value="category" <?php if($options['post_meta_type'] != 'tag') echo "checked='checked'"; ?> /> <?php _e('Show category.', 'piano-black'); ?><br />
<input name="post_meta_type" type="radio" value="tag" <?php if($options['post_meta_type'] == 'tag') echo "checked='checked'"; ?> /> <?php _e('Show tag.', 'piano-black'); ?>
</p>
<br />

<p><?php _e('Show time on comment.', 'piano-black'); ?></p>
<p>
<input name="time_stamp" type="checkbox" value="checkbox" <?php if($options['time_stamp']) echo "checked='checked'"; ?> /><?php _e('Yes', 'piano-black'); ?><br />
</p>
<br />

<p><?php _e('Page navi type.', 'piano-black'); ?></p>
<p>
<input name="page_navi_type" type="radio" value="pager" <?php if($options['page_navi_type'] != 'normal') echo "checked='checked'"; ?> /> <?php _e('Use Pager.', 'piano-black'); ?><br />
<input name="page_navi_type" type="radio" value="normal" <?php if($options['page_navi_type'] == 'normal') echo "checked='checked'"; ?> /> <?php _e('Use normal style next-previous link.', 'piano-black'); ?>
</p>
<br />

<p><?php _e('Check if you want to show Return top link.<br />( NOTICE : Return top link does not work on IE6. )', 'piano-black'); ?></p>
<p><input name="return_top" type="checkbox" value="checkbox" <?php if($options['return_top']) echo "checked='checked'"; ?> /> <?php _e('Show Return top link.', 'piano-black'); ?></p>
<br />

<p><input class="button-primary" type="submit" name="pb_save" value="<?php _e('Save Changes', 'piano-black'); ?>" /></p>

</form>

</div>

<?php
  }
}

// register functions
add_action('admin_menu', array('piano_black_options', 'update'));


// for localization
load_textdomain('piano-black', dirname(__FILE__).'/languages/' . get_locale() . '.mo');


// Remove [...] from excerpt
function trim_excerpt($text) {
  return rtrim($text,'[...]');
}
add_filter('get_the_excerpt', 'trim_excerpt');


// Sidebar widget
if ( function_exists('register_sidebar') ) {
    register_sidebar(array(
        'before_widget' => '<div class="side-box" id="%1$s">'."\n",
        'after_widget' => "</div>\n",
        'before_title' => '<h3 class="side-title">',
        'after_title' => "</h3>\n",
        'name' => 'top'
    ));
    register_sidebar(array(
        'before_widget' => '<div class="side-box-short" id="%1$s">'."\n",
        'after_widget' => "</div>\n",
        'before_title' => '<h3 class="side-title">',
        'after_title' => "</h3>\n",
        'name' => 'left'
    ));
    register_sidebar(array(
        'before_widget' => '<div class="side-box-short" id="%1$s">'."\n",
        'after_widget' => "</div>\n",
        'before_title' => '<h3 class="side-title">',
        'after_title' => "</h3>\n",
        'name' => 'right'
    ));
    register_sidebar(array(
        'before_widget' => '<div class="side-box" id="%1$s">'."\n",
        'after_widget' => "</div>\n",
        'before_title' => '<h3 class="side-title">',
        'after_title' => "</h3>\n",
        'name' => 'bottom'
    ));
}


// Original custom comments function is written by mg12 - http://www.neoease.com/

if (function_exists('wp_list_comments')) {
	// comment count
	add_filter('get_comments_number', 'comment_count', 0);
	function comment_count( $commentcount ) {
		global $id;
		$_commnets = get_comments('post_id=' . $id);
		$comments_by_type = &separate_comments($_commnets);
		return count($comments_by_type['comment']);
	}
}


function custom_comments($comment, $args, $depth) {
	$GLOBALS['comment'] = $comment;
	global $commentcount;
	if(!$commentcount) {
		$commentcount = 0;
	}
?>
<?php $options = get_option('pb_options'); ?>

 <li class="comment <?php if($comment->comment_author_email == get_the_author_email()) {echo 'admin-comment';} else {echo 'guest-comment';} ?>" id="comment-<?php comment_ID() ?>">
  <div class="comment-meta">
   <div class="comment-meta-left clearfix">
  <?php if (function_exists('get_avatar') && get_option('show_avatars')) { echo get_avatar($comment, 35); } ?>
  
    <ul class="comment-name-date">
     <li class="comment-name">
<?php if (get_comment_author_url()) : ?>
<a id="commentauthor-<?php comment_ID() ?>" class="url <?php if($comment->comment_author_email == get_the_author_email()) {echo 'admin-url';} else {echo 'guest-url';} ?>" href="<?php comment_author_url() ?>" rel="external nofollow">
<?php else : ?>
<span id="commentauthor-<?php comment_ID() ?>">
<?php endif; ?>

<?php comment_author(); ?>

<?php if(get_comment_author_url()) : ?>
</a>
<?php else : ?>
</span>
<?php endif; ?>
     </li>
     <li class="comment-date"><?php echo get_comment_time(__('F jS, Y', 'piano-black')); if ($options['time_stamp']) : echo get_comment_time(__(' g:ia', 'piano-black')); endif; ?></li>
    </ul>
   </div>

   <ul class="comment-act">
<?php if (function_exists('comment_reply_link')) { 
        if ( get_option('thread_comments') == '1' ) { ?>
    <li class="comment-reply"><?php comment_reply_link(array_merge( $args, array('add_below' => 'comment-content', 'depth' => $depth, 'max_depth' => $args['max_depth'], 'reply_text' => '<span><span>'.__('REPLY','piano-black').'</span></span>'.$my_comment_count))) ?></li>
<?php   } else { ?>
    <li class="comment-reply"><a href="javascript:void(0);" onclick="MGJS_CMT.reply('commentauthor-<?php comment_ID() ?>', 'comment-<?php comment_ID() ?>', 'comment');"><?php _e('REPLY', 'piano-black'); ?></a></li>
<?php   }
      } else { ?>
    <li class="comment-reply"><a href="javascript:void(0);" onclick="MGJS_CMT.reply('commentauthor-<?php comment_ID() ?>', 'comment-<?php comment_ID() ?>', 'comment');"><?php _e('REPLY', 'piano-black'); ?></a></li>
<?php } ?>
    <li class="comment-quote"><a href="javascript:void(0);" onclick="MGJS_CMT.quote('commentauthor-<?php comment_ID() ?>', 'comment-<?php comment_ID() ?>', 'comment-content-<?php comment_ID() ?>', 'comment');"><?php _e('QUOTE', 'piano-black'); ?></a></li>
    <?php edit_comment_link(__('EDIT', 'piano-black'), '<li class="comment-edit">', '</li>'); ?>
   </ul>

  </div>
  <div class="comment-content" id="comment-content-<?php comment_ID() ?>">
  <?php if ($comment->comment_approved == '0') : ?>
   <span class="comment-note"><?php _e('Your comment is awaiting moderation.', 'piano-black'); ?></span>
  <?php endif; ?>
  <?php comment_text(); ?>
  </div>

<?php } ?>