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

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

<xsl:output method="html" doctype-system="about:legacy-compat"/>

<xsl:template match='club_voleibol'>

<html lang="es"> 
    <head>

        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>

        <meta charset="utf-8"/>

        <meta name="description" content="Página principal"/> 

        <title>titulo de la web</title>    

    </head>

    <body>
        <header>

            <img src= "../img/logotipo.png" alt= "Reservas" />

            <a href="tienda.xml">Tienda</a>

            <a href="equipos.xml">Equipos</a>

            <a href="partidos.xml">Partidos</a>        

        </header>     
                                                 
        <main >
            <h1>PARTIDOS</h1>
              
            <table>
				<tr>
					<th>PARTIDO</th>
					<th>FECHA</th>
					<th>RESULTADO</th>
				</tr>
                 <!-- Seleccionamos los partidos que queremos mostrar y les aplicamos la plantilla correspondiente -->
				<xsl:apply-templates select="partido"/>             
			</table>             
            
        </main>

        <footer>

            <address>&#169; Desarrollado por info@birt.eus</address>

        </footer>

    </body>

</html>  

</xsl:template>

<!-- Plantilla para los partidos -->
<xsl:template match="partido">

    <tr>       
        <!-- Mostramos los equipos -->
        <td><xsl:value-of select="equipos/local/text()"/>-<xsl:value-of select="equipos/visitante/text()"/></td>
        
        <!-- Mostramos la fecha del partido -->
        <td><xsl:value-of select="fecha"/></td>              

        
        <!-- Hacemos uso del condicionante if-->
        <!-- Si la puntuacion local es menor (&lt) que la visitante se aplica un estilo azul -->
        <xsl:if test="equipos/local/@puntuacion &lt; equipos/visitante/@puntuacion">

            <td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/>-<xsl:value-of select="equipos/visitante/@puntuacion"/></td>

        </xsl:if>

        
        <!-- Si la puntuacion local es mmayor (&gt) que la visitante no se aplica un estilo azul -->
        <xsl:if test="equipos/local/@puntuacion &gt; equipos/visitante/@puntuacion">

            <td><xsl:value-of select="equipos/local/@puntuacion"/>-<xsl:value-of select="equipos/visitante/@puntuacion"/></td>

        </xsl:if>

    </tr>

</xsl:template>

</xsl:stylesheet>


    
    

