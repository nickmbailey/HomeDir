<?php get_header(); ?>

	<div id="content">

	<?php if (have_posts()) : the_post(); ?>
	
		<div id="post-<?php the_ID(); ?>" class="post">
			<h1 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h1>
			<small><?php the_time('F jS, Y') ?> <!-- by <?php the_author() ?> --></small>
			<div class="entry">
				<?php the_content('Read the rest of this entry &raquo;'); ?>
			</div>
			<div class="meta">
				<p class="links">
					<a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>" class="more">Read full article</a>
					<b>|</b>
					<?php comments_popup_link('No Comments', '1 Comment', '% Comments', 'comments'); ?>
				</p>
			</div>
		</div>
	
		<?php while (have_posts()) : the_post(); ?>

			<div id="post-<?php the_ID(); ?>" class="post">
				<h2 class="title"><a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>"><?php the_title(); ?></a></h2>
				<div class="entry">
					<?php the_content('Read the rest of this entry &raquo;'); ?>
				</div>
				<div class="meta">
					<p class="links">
						<a href="<?php the_permalink() ?>" rel="bookmark" title="Permanent Link to <?php the_title(); ?>" class="more">Read full article</a>
						<b>|</b>
						<?php comments_popup_link('No Comments', '1 Comment', '% Comments', 'comments'); ?>
					</p>
				</div>
			</div>

		<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php previous_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php next_posts_link('Next Entries &raquo;') ?></div>
		</div>

	<?php else : ?>

		<h2 class="center">Not Found</h2>
		<p class="center">Sorry, but you are looking for something that isn't here.</p>
		<?php include (TEMPLATEPATH . "/searchform.php"); ?>

	<?php endif; ?>

	</div>

	<?php get_sidebar(); ?>

<?php get_footer(); ?>
