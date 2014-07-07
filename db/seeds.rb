Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-seminars').blank?
        user.plugins.create(:name => 'refinerycms-seminars',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/seminars"
  if defined?(Refinery::Page)
    unless page = Refinery::Page.where(:link_url => url).first
      page = Refinery::Page.create!(
        :title => 'Seminars',
        :link_url => url,
        :deletable => false,
        :menu_match => "^#{url}(\/|\/.+?|)$"
      )
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        page.parts.create(:title => default_page_part, :body => nil, :position => index)
      end
    end

    unless page.children.find_by_path("/seminars/sign-up")
      signup = page.children.create!(
        :title => "Sign Up",
        :deletable => false,
        :show_in_menu => false
      )
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        signup.parts.create(:title => default_page_part, :body => nil, :position => index)
      end
    end

    unless page.children.find_by_path("/seminars/thank-you")
      thank_you = page.children.create!(
        :title => 'Thank You',
        :deletable => false,
        :show_in_menu => false
      )
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        thank_you.parts.create(:title => default_page_part, :body => nil, :position => index)
      end
    end
  end
end
