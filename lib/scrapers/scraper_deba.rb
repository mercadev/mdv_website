
class Scrapers::ScraperDeba

  HEADER = ["Nom", "Activité", "User", "E-mail", "Mobile", "Téléphone fixe", "Adresse postale", "Site web", "Gérant", "Date de création"]
  ROOT_URL = "https://www.ledeba.com/adherents/"
  PAGE_URL = ROOT_URL + "?upage="

  attr_reader :data, :progress

  def initialize
    @progress = 0
  end

  def start
    @data = self.class.get_all_data
  end

  private

  def self.get_page_count
    page = Nokogiri::HTML(open(ROOT_URL))

    link = page.xpath('//span[@class="page-numbers dots"]/following-sibling::a')[0] # lien de la dernière page

    return link.text.to_i
  end

  def self.get_links(page_url)
    page = Nokogiri::HTML(open(page_url))

    links = page.xpath('//div[@class="item-title"]/a')

    return links
  end

  def self.get_all_links
    puts "Analyse des pages..."
    n = get_page_count
    links = Array.new
    for i in 1..n
      puts "Page #{i} / #{n}"
      links.concat(get_links(PAGE_URL + i.to_s))
    end
    puts "#{links.size} entreprises trouvées"
    return links
  end

  def self.get_all_data
    data_array = Array.new
    links = get_all_links
    n = links.size
    puts "Récupération des données..."
    links.each.with_index(1) { |link, i|
      puts "Entreprise #{i} / #{n}"
      data_array << get_data(link['href'])
    }
    return data_array
  end

  def self.get_data(item_url)
    page = Nokogiri::HTML(open(item_url))

    user = get_text(page, '//i[contains(@class,"fa-user")]/..')
    splitter = Scrapers::NameSplitter.new(user)
    first_name = splitter.first_name
    last_name = splitter.last_name

    company = get_text(page, '//h1[@class="entry-title"]')
    activity = get_text(page, '//div[@class="activite"]/span')
    email = get_text(page, '//i[contains(@class,"fa-at")]/../a')
    mobile_phone = get_text(page, '//i[contains(@class,"fa-mobile")]/../a')
    fixed_phone = get_text(page, '//i[contains(@class,"fa-phone")]/../a')
    address = get_text(page, '//i[contains(@class,"fa-home")]/../span')
    website = get_text(page, '//i[contains(@class,"fa-globe")]/../a')
    gerant = get_text(page, '//ul/li/span[text()="Gérant"]/..')
    # creation = get_text(page, '//ul/li/span[text()="Date de création"]/..')

    profession = user.casecmp?(gerant) ? "Gérant" : ""

    return {
      first_name: first_name,
      last_name: last_name,
      company: company,
      activity: activity,
      profession: profession,
      email: email,
      mobile_phone: mobile_phone,
      fixed_phone: fixed_phone,
      address: address,
      website: website
    }
  end

  def self.get_text(page, xpath)
    text_nodes = page.xpath(xpath + '/text()') # astuce pour cibler uniquement le texte du noeud (en ignorant les sous-noeuds)
    if text_nodes.empty?
      return ""
    end
    return text_nodes.to_a.join(" ").strip
  end

end