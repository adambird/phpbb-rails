require 'test_helper'
include ApplicationHelper

class ApplicationHelperTest < ActiveSupport::TestCase
  
  test "size formatting removed in clean_body" do
    body = "[size=18:a8ab2f61b1]Along with the mitts......They are on their way to Nottingham\n....... Watch this space ! [/size:a8ab2f61b1]"
    
    assert_equal "Along with the mitts......They are on their way to Nottingham\n....... Watch this space ! ", clean_body(body)
  end

  test "inline image urls" do
    body = "Off Road\r\n\r\n[img:748de9a948]http://i233.photobucket.com/albums/ee65/playfords/Mountain%20Bike/Team%20Commencal/IMG_8302.jpg[/img:748de9a948]\r\n\r\nOn Road\r\n\r\n[img:748de9a948]http://i233.photobucket.com/albums/ee65/playfords/Road%20Bike/IMG_7461.jpg[/img:748de9a948]\r\n\r\nCommuter\r\n\r\n[img:748de9a948]http://i233.photobucket.com/albums/ee65/playfords/Mountain%20Bike/Image150-1.jpg[/img:748de9a948]\r\n"
    expected = "Off Road\r\n\r\nhttp://i233.photobucket.com/albums/ee65/playfords/Mountain%20Bike/Team%20Commencal/IMG_8302.jpg\r\n\r\nOn Road\r\n\r\nhttp://i233.photobucket.com/albums/ee65/playfords/Road%20Bike/IMG_7461.jpg\r\n\r\nCommuter\r\n\r\nhttp://i233.photobucket.com/albums/ee65/playfords/Mountain%20Bike/Image150-1.jpg\r\n"
    assert_equal expected, clean_body(body)
  end

  test "bold formatting and unicode characters" do
    body = "[b:8ceec832af]No photo sorry, don\ufffd\ufffd\ufffdt want to frighten the horses.[/b:8ceec832af]\r\n\r\n\r\n\r\n\r\n[b:8ceec832af]Who are you and tell us a little about yourself?[/b:8ceec832af]\r\n\r\nHello everyone I\ufffd\ufffd\ufffdm Jim, 29 and originally from the Lake District, now working at the University as a postdoctoral research fellow (slave). I\ufffd\ufffd\ufffdm single, no kids, no pets but I\ufffd\ufffd\ufffdve got most of my own teeth.\r\n\r\n[b:8ceec832af]What\ufffd\ufffd\ufffds your motivation to get on your bike?[/b:8ceec832af]"
    expected = "No photo sorry, don't want to frighten the horses.\r\n\r\n\r\n\r\n\r\nWho are you and tell us a little about yourself?\r\n\r\nHello everyone I'm Jim, 29 and originally from the Lake District, now working at the University as a postdoctoral research fellow (slave). I'm single, no kids, no pets but I've got most of my own teeth.\r\n\r\nWhat's your motivation to get on your bike?"

    assert_equal expected, clean_body(body)
  end
  
  test "url and image and formating" do
    body = "[url=http://gallery.myff.org/gallery/772580/richard+mcb.jpg][img:e279f12d55]http://gallery.myff.org/gallery/_772580/richard+mcb.jpg[/img:e279f12d55][/url]\r\n[size=9:e279f12d55][color=red:e279f12d55]Click to see full size image[/color:e279f12d55][/size:e279f12d55]\r\n\r\n[b:e279f12d55]Who are you and tell us a little about yourself?[/b:e279f12d55]\r\n\r\n27 years old, married to Liz, no kids, 1 cat Alfie, live in Chilwell, work in Derby as a Senior Structural Technician for a small consulting engineering company, been riding bikes since shortly after I could walk\r\n\r\n[b:e279f12d55]What\ufffd\ufffd\ufffds your motivation to get on your bike?[/b:e279f12d55]"
    expected = "http://gallery.myff.org/gallery/_772580/richard+mcb.jpg\r\nClick to see full size image\r\n\r\nWho are you and tell us a little about yourself?\r\n\r\n27 years old, married to Liz, no kids, 1 cat Alfie, live in Chilwell, work in Derby as a Senior Structural Technician for a small consulting engineering company, been riding bikes since shortly after I could walk\r\n\r\nWhat's your motivation to get on your bike?"

    assert_equal expected, clean_body(body)    
  end
  
  test "pound sterling currency symbol" do
    body = "Cost: \ufffd\ufffd24, \ufffd\ufffd26 or \ufffd\ufffd28\r\n\r\nWeather permitting th"
    expected = "Cost: £24, £26 or £28\r\n\r\nWeather permitting th"

    assert_equal expected, clean_body(body)    
  end
  
  test "unescape title" do
    body = "Facebook &amp; Twitter 'Like' buttons added to forums"
    expected = "Facebook & Twitter 'Like' buttons added to forums"

    assert_equal expected, remove_html_escape(body)    
  end
end