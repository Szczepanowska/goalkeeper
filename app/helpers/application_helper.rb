module ApplicationHelper
  def default_meta_tags
    {
      site: 'Goalkeeper',
      title: 'Goalkeeper',
      reverse: true,
      separator: '|',
      description: 'The tool to help you better manage your goals!',
      keywords: 'productive, organize, lifestyle',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('goals.jpeg'), rel: 'touch-icon', sizes: '180x180', type: 'image/jpeg' },
      ],
      og: {
        site_name: 'Goalkeeper',
        title: 'Goalkeeper',
        description: 'The tool to help you better manage your goals!',
        type: 'website',
        url: request.original_url,
        image: image_url('goals.jpeg')
      }
    }
  end
end
