<%@ control language="VB" autoeventwireup="false" inherits="Modules_UserPaperForm, App_Web_q91opoz6" %>  
    
    <style type="text/css">
        #imgLogo
        {
            height:         83px;
            width:          105.428571px;
        }
            
        h2,h3
        {
            margin-top:     0px;
            padding-top:    0px;
            font-size:      12px;
        }
        
        div#content
        {            
            height:         27.9cm;                  
            margin-top:     0px;
            margin-bottom:  2cm;
        }
        
        div#head
        {
            
            width:          21.59cm;
            height:         2.20cm;
            left:           0px;
            top:            0px;
            margin-left:    0px;
            margin-right:   auto;
        }
        
        div#columns
        {
            position:       relative;
            width:          21.59cm;
            left:           0px;
            top:            0cm;
            font-size:      10px;
            text-align:     left;
        }
        
        div#userID
        {
            border-style:   solid;
            border-width:   1px;
        }
        
        div#framed
        {
            border-style:   solid;
            border-width:   1px;
        }
        
        div.sameLineItem
        {
            float:          left;
        }
        
        div.sameLineItemTable
        {
            float:          left;
            padding-right:  1em;
            vertical-align: middle;
        }
        
        img.poPhoto
        {
            border:         2px solid white;
            height:         187,5px;
            width:          125px;
        }
      
        Table#purchaseOrder
        {
            width:          90%;
        }
        
        Table#purchaseOrder TD.other
        {
            width:          16%;
        }
        
        Table#purchaseOrder TD.total
        {
            text-align:     left;
        }
        
        TABLE.myTable
        {
            line-height:    9px;
            margin-left:    auto;
            margin-right:   auto;
            text-align:     center;
            empty-cells:    show;
        }
        
        TD.spaceCell
        {
            border-width:   0px;
        }
        
        td.doubleLine
        {
            line-height:    7.5px
        }
        th.codeTableHeader
        {
            line-height:    10px;
        }
    </style>


<div id="content">
    <div id="head">
        <div class="sameLineItem">
            <asp:Image id="imgLogo" meta:resourcekey="imgHeaderLogo" runat="server" />
        </div>
        <div class="sameLineItem">
            <h3><asp:Label ID="lblPOTitle" runat="server" meta:resourcekey="lblPOTitle"></asp:Label></h3>
        </div>        
    </div>
    
    <div id="columns">                   
        <div title="section1">
        <p><asp:Label ID="lblSection1" runat="server" meta:resourcekey="lblSection1Resource1"></asp:Label></p>
        <table class="myTable" border="1">
            <tr>
                <th width="10px" class="codeTableHeader"><asp:Label ID="lblKitCode1" runat="server" Text="Codes Ensemble" meta:resourcekey="lblKitCode"></asp:Label></th>
                <th width="auto"><asp:Label ID="lblKitDescription1" runat="server" Text="Description" meta:resourcekey="lblKitDescription"></asp:Label></th>
                <th><asp:Label ID="lblKitPrice1" runat="server" Text="Prix" meta:resourcekey="lblKitPrice"></asp:Label></th>
                <th width="10px" class="codeTableHeader"><asp:Label ID="lblKitCode2" runat="server" Text="Codes Ensemble" meta:resourcekey="lblKitCode"></asp:Label></th>
                <th class="codeTableHeader" width="auto"><asp:Label ID="lblKitDescription2" runat="server" Text="Description" meta:resourcekey="lblKitDescription"></asp:Label></th>
                <th><asp:Label ID="lblKitPrice2" runat="server" Text="Prix" meta:resourcekey="lblKitPrice"></asp:Label></th>
            </tr>
            <tr>
                <td><b>A</b></td>
                <td>
                    <div class="sameLineItemTable">
                        <asp:Label ID="lblKitA" runat="server" Text="7 photos" meta:resourcekey="lblKitAResource1"></asp:Label>
                    </div>
                    <div class="sameLineItemTable">
                        <table>
                            <tr>
                                <td>1 -> 5" x 7"</td>
                                <td>4 -> 1¾" x 2½"</td>
                            </tr>
                            <tr>
                                <td>2 -> 2½" x 3½</td>
                                <td>&nbsp</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceA" runat="server" meta:resourcekey="txtPriceA" style="text-align: center; width: 50px;" Text="8,00$"></asp:TextBox> </td>
                <td><b>B</b></td>
                <td>
                    <div class="sameLineItemTable">
                        <asp:Label ID="lblKitB" runat="server" Text="14 photos" meta:resourcekey="lblKitBResource1"></asp:Label>
                    </div>
                    <div class="sameLineItemTable">
                        <table>
                            <tr>
                                <td>2 -> 5" x 7"</td>
                                <td>8 -> 2½" x 3½"</td>
                            </tr>
                            <tr>
                                <td>4 -> 3½" x 5"</td>
                                <td>&nbsp</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceB" runat="server" meta:resourcekey="txtPriceB" style="text-align: center; width: 50px;" Text="13,00$"></asp:TextBox> </td>
            </tr>
            <tr>
                <td><b>C</b></td>
                <td class="doubleLine">
                    <div class="sameLineItemTable">
                        <asp:Label ID="lblKitC" runat="server" Text="15 photos" meta:resourcekey="lblKitCResource1"></asp:Label>
                    </div>
                    <div class="sameLineItemTable">
                        <table>
                            <tr>
                                <td>1 -> 8"x10"</td>
                                <td>4 -> 3½" x 5"</td>
                            </tr>
                            <tr>
                                <td>2 -> 5" x 7"</td>
                                <td>8 -> 2½" x 3"</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td><asp:TextBox BorderWidth="0px" ID="txtPriceC" runat="server" meta:resourcekey="txtPriceC" style="text-align: center; width: 50px;" Text="16,00$"></asp:TextBox> </td>
                <td><b>D</b></td>
                <td class="doubleLine">
                    <div class="sameLineItemTable">
                        <asp:Label ID="lblKitD" runat="server" Text='32 photos' meta:resourcekey="lblKitDResource1"></asp:Label>
                    </div>
                    <div class="sameLineItemTable">
                        <table>
                            <tr>
                                <td>1 -> 10" x 13"</td>
                                <td>4 -> 3½" x 5"</td>
                                <td>1 -> 8" x 10"</td>
                            </tr>
                            <tr>
                                <td>8 -> 2½" x 3½"</td>
                                <td>2 -> 5" x 7"</td>
                                <td>16 -> 1¾" x 2½"</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceD" runat="server" meta:resourcekey="txtPriceD" style="text-align: center; width: 50px;" Text="23,00$"></asp:TextBox> </td>
            </tr>
        </table>
        </div>
        
        <div title="section2">
        <p><asp:Label ID="lblSection2" runat="server" Text="2. Si désiré, vous pouvez compléter votre commande avec des feuilles supplémentaires à l'unité." meta:resourcekey="lblSection2Resource1"></asp:Label></p>
        <table class="myTable" border="1">
            <tr>
                <th class="codeTableHeader"><asp:Label ID="lblSheetCode1" runat="server" Text="Codes Feuille" meta:resourcekey="lblSheetCode1"></asp:Label></th>
                <th><asp:Label ID="lblSheetDescription1" runat="server" Text="Description" meta:resourcekey="lblSheetDescription1"></asp:Label></th>
                <th><asp:Label ID="lblSheetPrice1" runat="server" Text="Prix" meta:resourcekey="lblSheetPrice1"></asp:Label></th>
                <th><asp:Label ID="lblSheetCode2" runat="server" Text="Codes Feuille" meta:resourcekey="lblSheetCode2"></asp:Label></th>
                <th><asp:Label ID="lblSheetDescription2" runat="server" Text="Description" meta:resourcekey="lblSheetDescription2"></asp:Label></th>
                <th><asp:Label ID="lblSheetPrice2" runat="server" Text="Prix" meta:resourcekey="lblSheetPrice2"></asp:Label></th>
            </tr>
            <tr>
                <td>E</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitE" runat="server" Text="1 photo" meta:resourcekey="lblKitEResource1"></asp:Label></div>
                    <div class="sameLineItemTable">1 -> 8" x 10"</div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceE" runat="server" meta:resourcekey="txtPriceE" style="text-align: center;" Text="6,00$"></asp:TextBox> </td>
                <td>H</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitH" runat="server" Text="4 photos" meta:resourcekey="lblKitHResource1"></asp:Label></div>
                    <div class="sameLineItemTable">4 -> 3½" x 5"</div>
                </td>
                <td><asp:TextBox BorderWidth="0px" ID="txtPriceH" runat="server" meta:resourcekey="txtPriceH" style="text-align: center;" Text="6,00$"></asp:TextBox> </td>
            </tr>
            <tr>
                <td>F</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitF" runat="server" Text="1 photo" meta:resourcekey="lblKitFResource1"></asp:Label></div>
                    <div class="sameLineItemTable">1 -> 10" x 13"</div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceF" runat="server" meta:resourcekey="txtPriceF" style="text-align: center;" Text="9,00$"></asp:TextBox> </td>
                <td>I</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitI" runat="server" Text="8 photos" meta:resourcekey="lblKitIResource1"></asp:Label></div>
                    <div class="sameLineItemTable">8 -> 2½" x 3½"</div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceI" runat="server" meta:resourcekey="txtPriceI" style="text-align: center;" Text="6,00$"></asp:TextBox> </td>
            </tr>
            <tr>
                <td>G</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitG" runat="server" Text="2 photos" meta:resourcekey="lblKitGResource1"></asp:Label></div>
                    <div class="sameLineItemTable">2 -> 5" x 7"</div>
                </td>
                <td><asp:TextBox BorderWidth="0px" ID="txtPriceG" runat="server" meta:resourcekey="txtPriceG" style="text-align: center;" Text="6,00$"></asp:TextBox> </td>
                <td>J</td>
                <td>
                    <div class="sameLineItemTable"><asp:Label ID="lblKitJ" runat="server" Text="16 photos" meta:resourcekey="lblKitJResource1"></asp:Label></div>
                    <div class="sameLineItemTable">16 -> 1¾" x 2½"</div>
                </td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceJ" runat="server" meta:resourcekey="txtPriceJ" style="text-align: center;" Text="6,00$"></asp:TextBox> </td>
            </tr>
        </table>
        </div>
        
        <div title="section3">
        <p><asp:Label ID="lblSection3" runat="server" Text="3. Pour chaque item commandé (ensemble ou feuille), vous devez indiquer la pose et la toile de fond choisie ansi que la quantité et le total pour la ligne. Ex :" meta:resourcekey="lblSection3Resource1"></asp:Label></p>
        <table class="myTable" border="1">
            <tr>
                <th class="codeTableHeader"><asp:Label ID="lblShoot1" runat="server" Text="Pose" meta:resourcekey="lblShoot1"></asp:Label></th>
                <th><asp:Label ID="lblBackground1" runat="server" Text="Toile de fond" meta:resourcekey="lblBackground1"></asp:Label></th>
                <th><asp:Label ID="lblCode1" runat="server" Text="Code" meta:resourcekey="lblCode1Resource1"></asp:Label></th>
                <th><asp:Label ID="lblQuantity1" runat="server" Text="Quantité" meta:resourcekey="lblQuantity1"></asp:Label></th>
                <th><asp:Label ID="lblTotal1" runat="server" Text="Total" meta:resourcekey="lblTotal1Resource1"></asp:Label></th>
            </tr>
            <tr>
                <td>P1</td>
                <td>F2</td>
                <td>D</td>
                <td>1</td>
                <td> <asp:TextBox BorderWidth="0px" ID="txtPriceExample" runat="server" style="text-align: center;" ></asp:TextBox> </td>
            </tr>
        </table>
        </div>
        
        <div class="text" title="section4">
        <p><asp:Label ID="lblSection4" runat="server" Text="4. Finalement, complétez le bon de commande en calculant le total et retournez le chez Caméléo Photo avec votre par chèque ou mandat poste. Vous pouvez également compléter le paiement par carte de crédit par téléphone (VISA, MasterCard)." meta:resourcekey="lblSection4Resource1"></asp:Label></p>
        </div>
        
        <div class="text" title="section5">
        <p><b><u><asp:Label ID="lblSection5" runat="server" Text="5. Toutes les taxes sont incluses dans les prix." meta:resourcekey="lblSection5Resource1"></asp:Label></u></b></p>
        </div>
        
        <div title="sectionNotes">
            <b><asp:Label ID="lblNotes" runat="server" Text="NOTES :" meta:resourcekey="lblNotesResource1"></asp:Label></b> <br />
            <ul>
                <li><asp:Label ID="lblNotes1" runat="server" Text="Si vous désirez commander des <b>produits dérivés</b> (tasses, porte-clés, tapis de souris, etc.) veuillez communique avec nous pour obtenir lex prix." meta:resourcekey="lblNotes1Resource1"></asp:Label></li>
                <li><asp:Label ID="lblNotes2" runat="server" Text="Les photos seront livrées gratuitement à l'école environ 4-6 semaines suivant la prise de la photographie." meta:resourcekey="lblNotes2Resource1"></asp:Label></li>
                <li><asp:Label ID="lblNotes3" runat="server" Text="Si vous dédisez <b>bénéficier de la livraison rapide à la maison</b> (10 jours ouvrables), veuillez <b>ajouter 3$ sur le total de votre commande</b> ou communiquez avec nous pour effectuer le paiement par téléphone." meta:resourcekey="lblNotes3Resource1"></asp:Label></li>
            </ul>
        </div>
        
        <div id="framed" title="sectionContact">
            <asp:Label runat="server" ID="lblContact1" Text="Si vous avez des questions, n'hésitez pas à <b>communiquer avec le support à la clientèle.</b>" meta:resourcekey="lblContact1Resource1"></asp:Label> <br />
            <asp:Label runat="server" ID="lblContact2" Text="- Par <b>courriel</b> (en tout temps) : support@cameleophoto.com" meta:resourcekey="lblContact2Resource1"></asp:Label> <br />
            <asp:Label runat="server" ID="lblContact3" Text="- Par <b>téléphone</b> (entre 9h00 et 17h30, du lundi au vendredi) : 514-499-0052 #701" meta:resourcekey="lblContact3Resource1"></asp:Label>
        </div>
        
        <div title="purchaseOrder">
            <br />
            <h3><asp:Label ID="lblPurchaseOrder" runat="server" Text="Bon de commande traditionnel :" meta:resourcekey="lblPurchaseOrder"></asp:Label></h3>
            
            <div id="userID">
                <asp:Label ID="lblUserID" runat="server" Text="Code d'usager: " meta:resourcekey="lblUserID"></asp:Label>
                <asp:TextBox ID="txtUserID" runat="server" BorderWidth="0px"></asp:TextBox>
            </div>
            
            <br />
            <table id="purchaseOrder" border="1">
                <tr>
                    <th width="20%"><asp:Label ID="lblShoot2" runat="server" Text="Pose" meta:resourcekey="lblShoot2"></asp:Label></th>
                    <th width="20%"><asp:Label ID="lblBackground2" runat="server" Text="Toile de fond" meta:resourcekey="lblBackground2"></asp:Label></th>
                    <th width="20%"><asp:Label ID="lblCode2" runat="server" Text="Code" meta:resourcekey="lblCode2Resource1"></asp:Label></th>
                    <th><asp:Label ID="lblQuantity2" runat="server" Text="Quantité" meta:resourcekey="lblQuantity2"></asp:Label></th>
                    <th width="20%"><asp:Label ID="lblTotal2" runat="server" Text="Total" meta:resourcekey="lblTotal2Resource1"></asp:Label></th>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="spaceCell"><asp:Label ID="lblTVQ" runat="server" Text="No. TVQ: 1211700552" meta:resourcekey="lblTVQResource1"></asp:Label></td>
                    <td colspan="2" class="spaceCell"></td>
                    <td><asp:Label ID="lblFastShipping" runat="server" Text="Livraison rapide (3$):" meta:resourcekey="lblFastShipping"></asp:Label></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="spaceCell"><asp:Label ID="lblTPS" runat="server" Text="No. TPS: 804271344" meta:resourcekey="lblTPSResource1"></asp:Label></td>
                    <td colspan="2" class="spaceCell"></td>
                    <td colspan="2" class="total"><b><asp:Label ID="lblOrderTotal" runat="server" Text="Total :" meta:resourcekey="lblOrderTotal"></asp:Label></b> </td>
                </tr>
            </table>
        </div>
        
        <br />
        
        <div title="exemplePhotos">
            <asp:Label ID="lblSampleIndication" runat="server" Text="*** Épreuve à titre indicatif seulement, impression finale sur papier photo de qualité supérieur ***" meta:resourcekey="lblSampleIndication"></asp:Label> <br />
            
            <table class="myTable" border="1">
                <tr>
                    <th colspan="4"><b><asp:Label ID="lblShoots" runat="server" Text="Poses" meta:resourcekey="lblShoots"></asp:Label></b></th>
                    <th colspan="4"><b><asp:Label ID="lblBackgrounds" runat="server" Text="Toiles de fond" meta:resourcekey="lblBackgrounds"></asp:Label></b></th>
                </tr>
                <tr>
                    <td><asp:Label ID="lblSootExample1" runat="server" Text="Pose 1" meta:resourcekey="lblSootExample1"></asp:Label></td>
                    <td><img src="" alt="" id="imgPhoto1" class="poPhoto" runat="server"/> </td>
                    <td><asp:Label ID="lblSootExample2" runat="server" Text="Pose 2" meta:resourcekey="lblSootExample2"></asp:Label></td>
                    <td><img id="imgPhoto2" src="" runat="server" class="poPhoto" alt="" /></td>
                    <td><asp:Label ID="lblBackgroundExample1" runat="server" Text="Fond 1" meta:resourcekey="lblBackgroundExample1"></asp:Label></td>
                    <td><img id="imgBackground1" src="" runat="server" class="poPhoto" alt="" /></td>
                    <td><asp:Label ID="lblBackgroundExample2" runat="server" Text="Fond 2" meta:resourcekey="lblBackgroundExample2"></asp:Label></td>
                    <td><img id="imgBackground2" src="" runat="server" class="poPhoto" alt="" /></td>
                </tr>
            </table>
            <br /><br /><br />
            <asp:Label ID="lblReturnAddress" runat="server" Text="" meta:resourcekey="lblReturnAddress"></asp:Label>_______________________________________________________________________________________________
        </div>
    </div>
</div>
