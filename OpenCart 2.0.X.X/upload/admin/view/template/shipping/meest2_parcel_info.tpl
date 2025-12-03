<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div>
            <h1 class="meest-title"><?php echo $heading_title; ?> <?php echo $text_parcel_info; ?></h1>
            <div>
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>
    </div>

    <div class="container-wrapper">
        <?php if ($response['status'] == 'OK') { ?>
            <div class="parcel-info card">
                <h3 class="meest-group-h3"><?php echo $text_parcel_info; ?></h3>
                <table class="table parcel-table">
                    <tr>
                        <td><?php echo $text_parcel_id; ?></td>
                        <td><?php echo $response['result']['parcelID']; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_parcel_number; ?></td>
                        <td><?php echo $response['result']['parcelNumber']; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_barcode; ?></td>
                        <td><?php echo $response['result']['barCode']; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_pay_type; ?></td>
                        <td><?php echo ($response['result']['payType'] == 'cash') ? $text_pay_cash : $text_pay_non_cash; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_receiver_pay; ?></td>
                        <td><?php echo ($response['result']['receiverPay']) ? $text_receiver_yes : $text_receiver_no; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_cost_services; ?></td>
                        <td><?php echo $response['result']['costServices']; ?> ₴</td>
                    </tr>
                    <tr>
                        <td><?php echo $text_weight; ?></td>
                        <td><?php echo $response['result']['weight']; ?> кг</td>
                    </tr>
                    <tr>
                        <td><?php echo $text_sending_date; ?></td>
                        <td><?php echo $response['result']['sendingDate']; ?></td>
                    </tr>
                    <tr>
                        <td><?php echo $text_sender; ?></td>
                        <td><?php echo $response['result']['sender']['name']; ?> (<?php echo $response['result']['sender']['phone']; ?>)</td>
                    </tr>
                    <tr>
                        <td><?php echo $text_receiver; ?></td>
                        <td><?php echo $response['result']['receiver']['name']; ?> (<?php echo $response['result']['receiver']['phone']; ?>)</td>
                    </tr>
                    <tr>
                        <td><?php echo $text_sender_address; ?></td>
                        <td><?php echo $response['result']['sender']['addressDescr']; ?>, <?php echo $response['result']['sender']['building']; ?> (<?php echo $response['result']['sender']['service']; ?>)</td>
                    </tr>
                    <tr>
                        <td><?php echo $text_receiver_address; ?></td>
                        <td><?php echo $response['result']['receiver']['addressDescr']; ?>, <?php echo $response['result']['receiver']['building']; ?> (<?php echo $response['result']['receiver']['service']; ?>)</td>
                    </tr>
                </table>
            </div>

            <?php if (isset($response['result']['COD']) && $response['result']['COD'] > 0) { ?>
                <div class="card-for-cod card">
                    <h3 class="meest-group-h3"><?php echo $text_card_for_cod; ?></h3>
                    <table class="table parcel-table">
                        <tr>
                            <td>COD</td>
                            <td><?php echo $response['result']['COD']; ?></td>
                        </tr>
                        <?php foreach ($response['result']['cardForCOD'] as $key => $value) { ?>
                        <tr>
                            <td><?php echo $key; ?></td>
                            <td><?php echo $value; ?></td>
                        </tr>
                        <?php } ?>
                    </table>
                </div>
            <?php } ?>

            <div class="package-details card">
                <h3 class="meest-group-h3"><?php echo $text_package_details; ?></h3>
                <table class="table parcel-table">
                    <?php foreach ($response['result']['placesItems'] as $index => $place) { ?>
                        <tr class="subheader">
                            <td><?php echo sprintf($text_place, $index + 1); ?></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_quantity; ?></td>
                            <td><?php echo $place['quantity']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_weight; ?></td>
                            <td><?php echo $place['weight']; ?> кг</td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_volume; ?></td>
                            <td><?php echo $place['volume']; ?> м³</td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_length; ?></td>
                            <td><?php echo $place['length']; ?> см</td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_width; ?></td>
                            <td><?php echo $place['width']; ?> см</td>
                        </tr>
                        <tr>
                            <td><?php echo $text_place_height; ?></td>
                            <td><?php echo $place['height']; ?> см</td>
                        </tr>
                        <tr>
                            <td><?php echo $text_insurance; ?></td>
                            <td><?php echo $place['insurance']; ?> ₴</td>
                        </tr>
                    <?php } ?>
                </table>
            </div>

            <div class="special-conditions card">
                <h3 class="meest-group-h3"><?php echo $text_special_conditions; ?></h3>
                <table class="table parcel-table">
                    <?php foreach ($response['result']['specConditionsItems'] as $condition) { ?>
                    <tr>
                        <td><?php echo $text_condition; ?></td>
                        <td><?php echo $condition['conditionDescr']; ?></td>
                    </tr>
                    <?php } ?>
                </table>
            </div>
        <?php } else { ?>
            <div class="alert alert-danger">
                <p><?php echo sprintf($get_info_error, $response['info']['message']); ?></p>
            </div>
        <?php } ?>
    </div>
</div>

<?php echo $footer; ?>
