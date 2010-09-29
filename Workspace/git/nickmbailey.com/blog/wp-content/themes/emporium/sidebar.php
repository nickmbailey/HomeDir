<div id="sidebar">
	<ul>
		<?php if (!function_exists('dynamic_sidebar') || !dynamic_sidebar()): ?>
		
		<li id="search" class="widget widget_search">
			<h2>Search</h2>
			<form id="searchform" method="get" action="<?php bloginfo('home'); ?>">
				<div>
					<input type="text" name="s" id="s" value="<?php the_search_query(); ?>" />
					<input type="submit" id="x" value="Search" />
				</div>
			</form>
		</li>

		<li>
			<h2>Archives</h2>
			<ul>
				<?php wp_get_archives('type=monthly'); ?>
			</ul>
		</li>
		
		<?php wp_list_categories('show_count=1&title_li=<h2>Categories</h2>'); ?>
		
		<?php wp_list_bookmarks(); ?>

		<li>
			<h2>Meta</h2>
			<ul>
				<?php wp_register(); ?>
				<li><?php wp_loginout(); ?></li>
				<li><a href="http://validator.w3.org/check/referer" title="This page validates as XHTML 1.0 Transitional">Valid <abbr title="eXtensible HyperText Markup Language">XHTML</abbr></a></li>
				<li><a href="http://gmpg.org/xfn/"><abbr title="XHTML Friends Network">XFN</abbr></a></li>
				<li><a href="http://wordpress.org/" title="Powered by WordPress, state-of-the-art semantic personal publishing platform.">WordPress</a></li>
				<?php wp_meta(); ?>
			</ul>
		</li>
			
		<?php endif; ?>
	</ul>
</div>
<!-- end sidebar -->