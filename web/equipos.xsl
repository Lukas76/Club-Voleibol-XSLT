<?xml version="1.0" encoding="UTF-8"?>
<!--
	Modulo: LMSGI
	UD: 04
	Fecha: 04/03/2024
	Autor: Lucas Arrospide Jauregui
	Tarea: Tarea evaluativa 2. XSLT
	Enunciado:El objetivo de esta tarea es utilizar el lenguaje XPath
	 y el estandar XSLT para transformar un sitio web 
	 de manera que obtenga los datos visualizados de un documento XML.
	Autoebaluacion: 
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" doctype-system="about:legacy-compat"/>
<xsl:template match="club_voleibol">

  <html lang="es"> 

    <head>

       <link href="../css/estilo.css" rel="stylesheet" type="text/css"/> <!-- Enlaza el archivo CSS -->

      <meta charset="utf-8"/> <!-- Establece la codificación de caracteres -->

      <meta name="description" content="Página principal"/> <!-- Agrega una descripción a la página -->

      <title>titulo de la web</title> <!-- Establece el título de la página -->

    </head>

    <body>

      <header>

        <img src="../img/logotipo.png" alt="Reservas" /> <!-- Inserta el logotipo -->

        <a href="tienda.xml">Tienda</a> <!-- Enlace a la tienda -->

        <a href="equipos.xml">Equipos</a> <!-- Enlace a la sección de equipos -->

        <a href="partidos.xml">Partidos</a> <!-- Enlace a la sección de partidos -->

      </header>       

      <main>

        <!-- Aplica la plantilla a los elementos 'equipo' dentro de 'club_voleibol' -->
        <xsl:apply-templates select="equipo"/>

      </main>

      <footer>

        <address>&#169; Desarrollado por info@birt.eus</address> 
      </footer>

    </body>

  </html>

</xsl:template>



<!-- Plantilla para los elementos 'equipo' -->
<xsl:template match="equipo">

<!-- Hacemos uso del condicionante if-->
<!-- Se muestran entrenador,equipos y jugadores si son de primera -->
<xsl:if test="@categoria='Primera'"> 

  <!-- Mostarmos el nombre del entrenador y lo enlazamos con la url de la pagina de su biografia -->
  <h1><a href="{entrenador/url}"><xsl:value-of select="entrenador/nombre"/></a></h1> 

  <article class="equipos">

    <!-- Mostarmos el nombre del equipo -->
    <h4><xsl:value-of select="nombre"/></h4> 

    <!-- Aplica la plantilla a los elementos 'jugador' dentro de 'jugadores' -->
    <xsl:apply-templates select="jugadores/jugador"/>

  </article>

  </xsl:if>

</xsl:template>



<!-- Plantilla para los elementos 'jugador' -->
<xsl:template match="jugador">

<!-- Hacemos uso del condicionante if-->
<!-- Se muestran tanto e numero de camiseta y nombre del jugador si son titulares -->
<xsl:if test="@titular='si'">  
  <p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p> 
</xsl:if>
</xsl:template>



</xsl:stylesheet>