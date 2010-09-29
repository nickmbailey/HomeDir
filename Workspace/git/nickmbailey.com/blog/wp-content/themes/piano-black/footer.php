  <div id="footer">
  </div>
 
 </div><!-- #contents end -->
</div><!-- #wrapper end -->

<?php $options = get_option('pb_options'); if ($options['return_top']) : ?>
<div id="return_top">
 <a href="#pngfix-right">&nbsp;</a>
</div>
<?php endif; ?>

<script type="text/javascript">
	var menu=new menu.dd("menu");
	menu.init("menu","menuhover");
</script>
<?php wp_footer(); ?>
</body>
</html>