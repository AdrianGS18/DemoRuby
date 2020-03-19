require './Controls/ControlsMovistar.rb'

class LibraryMovistar
  def initialize(pBroswer)

    @b = pBroswer
    @ctMovistar= ControlMovistar.new(@b)
  end
  def secureClick(pControl, pTimeOut=90)
    pTimeOut.to_i.times do
      begin
        pControl.click
        break
      rescue Exception => e
        if e.message.to_s.include?('obscures') or e.message.to_s.include?('Other element would receive the click')
          sleep 2
        else
          raise 'falló el click' + e.message.to_s + ' ' + e.backtrace.join("\n\t")
        end
      end
    end
  end
  def scroll(objControl)
    @b.execute_script('arguments[0].scrollIntoView();', objControl)
  end
  def validartexto(pTextoBuscado)

    Watir::Wait.until do
      @b.text.to_s.include?(pTextoBuscado)
    end

  end


  def seleccionar_plan(pCodigo)
    secureClick(@ctMovistar.linkMenu)
    secureClick(@ctMovistar.linkMenuPlan)
    scroll(@ctMovistar.btnContinuarP)
    secureClick(@ctMovistar.btnContinuarP)
    scroll(@ctMovistar.btnSeleccion)
    secureClick(@ctMovistar.btnSeleccion)
    @ctMovistar. txtCodigoPostal.send_keys pCodigo
    secureClick(@ctMovistar.btnValidar)
    sleep 3
    secureClick(@ctMovistar.btnResumen)
    scroll(@ctMovistar.btnComprarPlan)
    secureClick(@ctMovistar.btnComprarPlan)
  end
  def registrar_datos_plan(pEmail,pName,pApellidoP,pApellidoM,pTelefonoC,pRfc,pDomicilio,pNoDomicilio,pCiudad)
    @ctMovistar.txtEmail.send_keys pEmail
    scroll(@ctMovistar.txtName)
    @ctMovistar.txtName.send_keys pName
    @ctMovistar.txtApellidoP.send_keys pApellidoP
    @ctMovistar.txtApellidoM.send_keys pApellidoM
    @ctMovistar.txtTelefonoC.send_keys pTelefonoC
    @ctMovistar.txtRfc.send_keys pRfc
    @ctMovistar.txtDomicilio.send_keys pDomicilio
    scroll(@ctMovistar.txtNumeroDomicilio)
    @ctMovistar.txtNumeroDomicilio.send_keys pNoDomicilio
    secureClick(@ctMovistar.optionColonia)
    @ctMovistar.txtCiudad.send_keys pCiudad
  end
  def seleccionar_equipos
    secureClick(@ctMovistar.linkEquipos)
    scroll(@ctMovistar.btnDetalle)
    secureClick(@ctMovistar.btnDetalle)
    scroll(@ctMovistar.btnComprarEquipo)
    secureClick(@ctMovistar.btnComprarEquipo)
    scroll(@ctMovistar.btnComprarPlan)
    secureClick(@ctMovistar.btnComprarPlan)
    scroll(@ctMovistar.btnComprarPlan)
    secureClick(@ctMovistar.btnComprarPlan)
  end
  def registrar_datos_equipo(pEmail,pName,pApellidoP,pApellidoM,pTelefonoC,pRfc)
    scroll(@ctMovistar.txtName)
    @ctMovistar.txtName.send_keys pName
    @ctMovistar.txtApellidoP.send_keys pApellidoP
    @ctMovistar.txtApellidoM.send_keys pApellidoM
    @ctMovistar.txtEmail.send_keys pEmail
    @ctMovistar.txtTelefonoC.send_keys pTelefonoC
    @ctMovistar.txtRfc.send_keys pRfc
    secureClick(@ctMovistar.chkAceptarT)
    secureClick(@ctMovistar.btnContinuar)

  end
end