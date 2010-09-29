<?php get_header(); ?>

<div id="content">

	<?php if (have_posts()) : ?>
	
		<div class="post">
			<h1 class="title">Search Results for &ldquo;<?php the_search_query(); ?>&rdquo;</h1>
			<div class="entry">&nbsp;</div>
		</div>

		<?php while (have_posts()) : the_post(); ?>
			<div id="post-<?php the_ID(); ?>" class="post">
				<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h2>
				<h3 class="date"><?php the_time('F jS, Y') ?></h3>
				<div class="entry"><?php the_excerpt('Read the rest of this entry &raquo;'); ?></div>
				<p class="meta">
					<a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>" class="more">Read full article</a>
					<b>|</b>
					<?php comments_popup_link('No Comments &#187;', '1 Comment &#187;', '% Comments &#187;', 'comments'); ?>
				</p>
			</div>
		<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php previous_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php next_posts_link('Next Entries &raquo;') ?></div>
		</div>

	<?php else : ?>

		<div class="post">
			<h2 class="title">Search Results for &ldquo;<?php the_search_query(); ?>&rdquo;</h2>
			<div class="entry">
				<p>No posts found. Try a different search?</p>
			</div>
		</div>

	<?php endif; ?>

</div>
<!-- end content -->

<?php get_sidebar(); ?>

<?php get_footer(); ?>