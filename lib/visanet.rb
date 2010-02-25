##
# <pagto nome_pagto="Visa" disponivel="não" UsuarioLocaweb="" permite_parcelamento="não" num_parcelas="1" nome_visualizacao="Cartão Visa" VisanetCodPagamento="20" VisanetFileMode="1" VisanetID="1001734898" VisanetTipo="VBV" VisanetAuthentType="1" VisaNetAntiPopup="0" VisaNetEnviaNotificacaoProcessaCaptura="1" descricao_pagamento="Para pagamento rotativo ou parcelado. O débito será feito no cartão de crédito no dia do vencimento de sua fatura. Deve se levar em consideração o valor total da compra e não somente o valor da parcela. Este valor deve estar dentro do limite total de seu cartão de crédito. Não aceitamos cartões emitidos no exterior.">
##

# GeraTID
class Visanet
  @@config = nil
  def self.get_config
    return @@config if @@config
    content = File.read("#{Rails.root}/config/visanet.yml")
    @@config = OpenStruct.new(YAML.load(content)[:visanet])
  end
  def self.capture code
    require 'net/http'
    require 'uri'
    shopid = Visanet.get_config.shopid
    data = {'tid' => code, 'merchid' => shopid}
    Net::HTTP.post_form(URI.parse('http://localhost/cgi-bin/capture.exe'), data)
  end
  def self.code pagamento
    shopid = Visanet.get_config.shopid
    raise "Tamanho do shopid deve ser 10" if shopid.to_s.size != 10
    raise "Shopid deve ser numérico" unless shopid.is_a? Fixnum
    raise "Tamanho do pagamento deve ser 4" if pagamento.to_s.size != 4
    shopid_formatado = shopid.to_s[5..9]
    today = Date.today
    now = Time.now
    hhmmssd = now.strftime('%H%M%S') + now.usec.to_s.first
    datajuliana = today.yday
    dig_ano = today.year.to_s.last
#raise  "#{shopid_formatado}||#{dig_ano}||#{datajuliana}||#{hhmmssd}||#{pagamento}"
    return "#{shopid_formatado}#{dig_ano}#{datajuliana}#{hhmmssd}#{pagamento}"
  end

  module Helper
    ##
    # order
    #   - must be an AR instance or any other object but with a "total" and "id" method
    # card
    #   - :visa or ???
    ##
    def visanet_form order, card=:visa
      @card = card
      @config = Visanet.get_config
      @order = order
      render :partial => 'visanet/form'
    end
  end


end
