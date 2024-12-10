<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="UTF-8"/>
        <xsl:template match="recepta">
            <html lang="es">
                <head>
                    <meta charset="UTF-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <title>Receta - Pasta con salsa de coliflor</title>
                    <link rel="stylesheet" href="aesthetic.css"/>
                </head>
                
                <body>

                    <header>
                        <div class="logo">
                            <img src="Logo-Delicias.png" alt="Delicias Kitchen Logo"/>
                        </div>
                        <nav>
                            <a href="index.html">INICIO</a>
                            <a href="construccio.html">SOBRE MÍ</a>
                            <a href="llista_receptes.html">RECETAS</a>
                            <a href="formulari.html">CONTACTO</a>
                            <a href="construccio.html">OTRAS COSAS</a>
                        </nav>
                    </header>
                
                    <main>
                        <section style="text-align: center;">
                            <h1><xsl:value-of select="nom"/></h1>
                            <img>
                                <xsl:attribute name="src">
                                    <xsl:text>fotos_recetas/</xsl:text>
                                        <xsl:value-of select="imagen"/>
                                    <xsl:text>.jpg</xsl:text>
                                </xsl:attribute>
                                <xsl:attribute name="alt">
                                    <xsl:value-of select="nom"/>
                                </xsl:attribute>
                                <xsl:attribute name="style">
                                    <xsl:text>width: 500px; height: auto; object-fit: cover; border-radius: 8px;</xsl:text>
                                </xsl:attribute>
                            </img>
                        </section>

                        <section class="temps">
                            <h2>Información:</h2>
                                <ul>
                                    <xsl:for-each select="temps/*">
                                        <p>
                                            <strong>
                                                 <xsl:choose>
                                                    <xsl:when test="name() = 'preparacio'">Preparación</xsl:when>
                                                    <xsl:when test="name() = 'coccio'">Cocción</xsl:when>
                                                    <xsl:when test="name() = 'total'">Total</xsl:when>
                                                    <xsl:when test="name() = 'racions'">Raciones</xsl:when>
                                                    <xsl:when test="name() = 'dificultat'">Dificultad</xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="name()"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>:
                                            </strong>
                                            <xsl:value-of select="."/>
                                        </p>
                                    </xsl:for-each>
                                </ul>
                        </section>

                        <section class="ingredientes">
                            <h2>Ingredientes:</h2>
                                <ul>
                                    <xsl:for-each select="ingredients/*">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ul>
                        </section>

                        <section class="pasos">
                            <h2>Pasos:</h2>
                                <ol>
                                    <xsl:for-each select="passos/*">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ol>
                        </section>
                    </main>

                    <footer>
                        <ul>
                            <li><a href="#">Facebook</a></li>
                            <li><a href="#">Twitter</a></li>
                            <li><a href="#">Instagram</a></li>
                            <li><a href="#">Email</a></li>
                            <li><a href="#">RSS</a></li>
                        </ul>
                    </footer>
                </body>
            </html>
        </xsl:template>
</xsl:stylesheet>
            
