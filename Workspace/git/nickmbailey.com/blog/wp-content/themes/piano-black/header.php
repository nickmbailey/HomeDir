<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title><?php wp_title(''); if (function_exists('is_tag') and is_tag()) { ?><?php } if (is_archive()) { ?><?php } elseif (is_search()) { ?><?php echo $s; } if ( !(is_404()) and (is_search()) or (is_single()) or (is_page()) or (function_exists('is_tag') and is_tag()) or (is_archive()) ) { ?><?php _e(' | '); ?><?php } ?><?php bloginfo('name'); ?></title>
<link rel="alternate" type="application/rss+xml" title="<?php bloginfo('name'); ?> RSS Feed" href="<?php bloginfo('rss2_url'); ?>" />
<link rel="alternate" type="application/atom+xml" title="<?php bloginfo('name'); ?> Atom Feed" href="<?php bloginfo('atom_url'); ?>" /> 
<link rel="pingback" href="<?php bloginfo('pingback_url'); ?>" />

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />
<link rel="stylesheet" href="<?php bloginfo('template_url'); ?>/comment-style.css" type="text/css" media="screen" />
<?php if (strtoupper(get_locale()) == 'JA') : ?>
<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/japanese.css" type="text/css" media="screen" />
<?php elseif (strtoupper(get_locale()) == 'HE_IL' || strtoupper(get_locale()) == 'FA_IR') : ?>
<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/rtl.css" type="text/css" media="screen" />
<?php endif; ?>

<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/jscript.js"></script>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/comment.js"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="<?php bloginfo('template_url'); ?>/js/iepngfix.js"></script>
<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/ie6.css" type="text/css" media="screen" />
<![endif]--> 

<?php if ( is_singular() ) wp_enqueue_script( 'comment-reply' ); ?> 
<?php wp_head(); ?>
</head>

<body>
<div id="wrapper">
 <div id="contents">

 <div class="header-menu-wrapper clearfix">
 <div id="pngfix-right"></div>
  <ul class="menu" id="menu">
   <li class="<?php if (!is_paged() && is_home()) { ?>current_page_item<?php } else { ?>page_item<?php } ?>" id="header-menu-home"><a href="<?php echo get_settings('home'); ?>/"><?php _e('HOME','piano-black'); ?></a></li>
   <?php 
         $options = get_option('pb_options');
         if($options['header_menu_type'] == 'pages') {
         wp_list_pages('sort_column=menu_order&depth=0&title_li=&exclude=' . $options['exclude_pages']);
         } else {
         wp_list_categories('depth=0&title_li=&exclude=' . $options['exclude_category']);
         }
   ?>
  </ul>
  <div id="pngfix-left"></div>
  </div>

  <div id="header">
   <?php if ($options['use_logo']) : ?>
   <div id="logo_image">
    <h1><a href="<?php echo get_option('home'); ?>/"><img src="<?php bloginfo('template_url'); ?>/img/logo.gif" title="<?php bloginfo('name'); ?>" alt="<?php bloginfo('name'); ?>" /></a></h1>
   </div>
   <?php else : ?>
   <div id="logo">
    <a href="<?php echo get_option('home'); ?>/"><?php bloginfo('name'); ?></a>
    <h1><?php bloginfo('description'); ?></h1>
   </div>
   <?php endif; ?>
   <?php if ($options['header_rss']) : ?>
   <a href="<?php bloginfo('rss2_url'); ?>" id="rss-feed" title="<?php _e('Entries RSS','piano-black'); ?>" ><?php _e('RSS FEED','piano-black'); ?></a>
   <?php endif; ?>
   <?php if ($options['header_search']) : ?>
   <div id="search-area">
    <?php if ($options['use_google_search']) : ?>
    <form action="http://www.google.com/cse" method="get" id="searchform">
     <div><input type="text" value="<?php _e('Google Search','piano-black'); ?>" name="q" id="search-input" onfocus="this.value=''; changefc('white');" /></div>
     <div><input type="image" src="<?php bloginfo('template_url'); ?>/img/search-button.gif" name="sa" alt="<?php _e('Search from this blog.','piano-black'); ?>" title="<?php _e('Search from this blog.','piano-black'); ?>" id="search-button" />
          <input type="hidden" name="cx" value="<?php echo $options['custom_search_id']; ?>" />
          <input type="hidden" name="ie" value="UTF-8" />
     </div>
    </form>
    <?php else: ?>
     <form method="get" id="searchform" action="<?php bloginfo('home'); ?>/">
     <div><input type="text" value="<?php _e('Search','piano-black'); ?>" name="s" id="search-input" onfocus="this.value=''; changefc('white');" /></div>
     <div><input type="image" src="<?php bloginfo('template_url'); ?>/img/search-button.gif" alt="<?php _e('Search from this blog.','piano-black'); ?>" title="<?php _e('Search from this blog.','piano-black'); ?>" id="search-button" /></div>
    </form>
    <?php endif; ?>
  </div>
   <?php endif; ?>

  </div><!-- #header end -->