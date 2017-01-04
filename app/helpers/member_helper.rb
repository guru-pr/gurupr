module MemberHelper
  def image_tag_for(member, github_link: false)
    options =
      if github_link
        { link: "https://github.com/#{member.nickname}", target: '_blank' }
      else
        { link: '#', target: nil }
      end

    content_to_link_by(member, options)
  end

  private

  def content_to_link_by(member, options)
    link_to options[:link],
            target: options[:target], title: member.name, class: 'member',
            style: "background-image: url(#{member.image})" do

      content_tag(:p, member.name, class: :name)
    end
  end
end
