prawn_document() do |pdf|

  @@inches = 72
  @talkerwidth = 3 * @@inches
  @talkerheight = 2.7 * @@inches
  @pad = 6
  @fold = 0.4 * @@inches
  @producerheight = @talkerheight / 10.0
  @productheight = @talkerheight / 8.0
  @blurbheight = @talkerheight - @producerheight - @productheight - @fold - @pad*3
  @base = 18
  @talker_x = 0
  @talker_y = pdf.cursor - 60
  
   
  pdf.font "Helvetica", :size => 24
  pdf.text "LIME VENTURES"
  pdf.font "Helvetica", :size => 24, :style => :bold
  pdf.text "SHELF TALKERS"
  @talkers.each do |talker|
    if @talker_y - @talkerheight < pdf.bounds.bottom
      pdf.start_new_page
      @talker_x = 0
      @talker_y = pdf.bounds.top
    end
    pdf.bounding_box([@talker_x, @talker_y], :width => @talkerwidth, :height => @talkerheight) do
      pdf.font(:size => @base * 1)
      pdf.text_box talker.producer, 
        :width => @talkerwidth - @pad*2, :align => :center, :valign => :center, :height => @producerheight,
        :overflow => :shrink_to_fit,
        :at => [@pad, pdf.bounds.top - (@fold + @pad)]
      pdf.font(:size => @base * 1.3)
      pdf.text_box talker.product, 
        :width => @talkerwidth - @pad*2, :align => :center, :valign => :center, :height => @productheight,
        :overflow => :shrink_to_fit,
        :at => [@pad, pdf.bounds.top - (@fold + @pad) - @producerheight]
      pdf.font(:size => @base * 0.8)
      pdf.text_box talker.blurb, 
        :width => @talkerwidth - @pad*2, :align => :center, :valign => :center, :height => @blurbheight,
        :overflow => :shrink_to_fit,
        :at => [@pad, pdf.bounds.top - (@fold+@pad) - (@productheight + @pad) - @producerheight]
      
      pdf.undash
      pdf.line_width = 5
      pdf.stroke_bounds
      
      pdf.move_down @fold
      pdf.line_width = 0.5
      pdf.dash(1, :space => 1, :phase => 3)
      pdf.stroke_horizontal_rule

    end
    if @talker_x + @talkerwidth*2 > pdf.bounds.right
      @talker_y -= @talkerheight + 10
      @talker_x = 0
    else
      @talker_x += @talkerwidth + 10
    end
  end
end
