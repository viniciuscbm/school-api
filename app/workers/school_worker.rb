class SchoolWorker
  include Sidekiq::Worker

  def perform(id, name, cnpj)
    p "####################### Exemplo BackgrouJobs com Redis e Sidekiq ############################"

    p "Código (id) da Escola: #{id}"
    p "Nome da Escola: #{name}"
    p "CNPJ da Escola: #{cnpj}"

    p "Esse código é só um exemplo, para mostrar que o sidekiq e o redis estão configurados e funcionando."
    p "Em uma situação real poderia ser disparo de emails, relatórios, NF's e etc..."
    p "############################################################################################"
  end
end
