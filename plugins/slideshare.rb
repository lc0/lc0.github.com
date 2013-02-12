module Jekyll
  class SlideShare < Liquid::Tag

    def initialize(name, id, tokens)
      super
      @id = id.strip
    end

    def render(context)
      %(<center><iframe src="http://www.slideshare.net/slideshow/embed_code/#{@id}?rel=0" frameborder="0" width="597" height="486" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC;border-width:1px 1px 0;margin-bottom:5px" allowfullscreen> </iframe></center>)
    end
  end
end

Liquid::Template.register_tag('slideshare', Jekyll::SlideShare)