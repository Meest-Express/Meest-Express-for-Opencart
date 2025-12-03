<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="row">
                <h1 class="meest-heading"><?php echo $heading_title; ?> <?php echo $heading_title_order_update_form; ?></h1>
                <div class="pull-right">
                    <button type="submit" form="form-meest-cn" id="button-save-cn"><?php echo $button_save_cn; ?></button>
                </div>
            </div>
            <div class="row">
                <ul class="breadcrumb">
                    <?php foreach ($breadcrumbs as $breadcrumb): ?>
                        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </div>
        </div>
    </div>
    <?php if ($get_info_for_edit_error): ?>
        <div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $get_info_for_edit_error; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php endif; ?>
    <?php if ($response['status'] == 'OK' ): ?>
        <div class="panel-body">
            <input type="hidden" name="error_meesage" id="error_meesage" value="<?php echo $error_meesage; ?>">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-meest-cn" class="form-horizontal">
                <input type="hidden" name="sender_delivery_type" id="sender_delivery_type" value="<?php echo $parcel_info['sender']['service'] == 'Branch' ? 'department' : 'doors'; ?>">
                <input type="hidden" name="recipient_delivery_type" id="recipient_delivery_type" value="<?php echo $parcel_info['receiver']['service'] == 'Branch' ? 'department' : 'doors'; ?>">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title"><?php echo $text_sender; ?></h3>
                            <div class="btn-group pull-right" data-toggle="buttons">
                                <label class="btn btn-default btn-sm<?php echo ($parcel_info['sender']['service'] == 'Branch') ? ' active' : ''; ?>"
                                       data-toggle="tooltip"
                                       title="<?php echo $button_department_delivery; ?>">
                                    <input type="radio" name="sender_address_type" value="department">
                                    <span class="btn-text"><?php echo $text_branch; ?></span>
                                </label>
                                <label class="btn btn-default btn-sm<?php echo ($parcel_info['sender']['service'] == 'Door') ? ' active' : ''; ?>"
                                       data-toggle="tooltip"
                                       title="<?php echo $button_doors_delivery; ?>">
                                    <input type="radio" name="sender_address_type" value="doors">
                                    <span class="btn-text"><?php echo $text_doors; ?></span>
                                </label>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body" id="sender_department_delivery"
                                <?php if ($parcel_info['sender']['service'] != 'Branch') { ?>
                                    style="display: none;"
                                <?php } ?>>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender_person"><?php echo $entry_sender; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_person" value="<?php echo $parcel_info['sender']['name']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-sender_person" class="form-control custom-input-70"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender_phone"><?php echo $entry_phone; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_phone" value="<?php echo $parcel_info['sender']['phone']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-sender_phone" class="form-control custom-input-70"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-region"><?php echo $entry_sender_region; ?></label>
                                    <div class="col-sm-9">
                                        <select name="shipping_meest2_sender_region" id="input-sender-region" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($regions as $region): ?>
                                                <option value="<?php echo $region['region_id']; ?>" <?php if ($region['region_id'] == $branch_sender_info['region_id']): ?>selected<?php endif; ?>>
                                                    <?php echo $region['region_name_ua']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-city"><?php echo $entry_sender_city; ?></label>
                                    <div class="col-sm-9">
                                        <select name="shipping_meest2_sender_city" id="input-sender-city" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-branch"><?php echo $entry_branch; ?></label>
                                    <div class="col-sm-9">
                                        <select name="sender_branch" id="input-sender-branch" class="form-control selectpicker show-tick custom-select2" data-live-search="true">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        <div class="panel-body" id="sender_address_delivery"
                            <?php if ($parcel_info['sender']['service'] != 'Door') { ?>
                                style="display: none;"
                            <?php } ?>>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender_person-address"><?php echo $entry_sender; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_person-address" value="<?php echo $parcel_info['sender']['name']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-sender_person" class="form-control custom-input-70"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender_phone-address"><?php echo $entry_phone; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_phone-address" value="<?php echo $parcel_info['sender']['phone']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-sender_phone" class="form-control custom-input-70"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-region-address"><?php echo $entry_sender_region; ?></label>
                                    <div class="col-sm-9">
                                        <select name="sender-region-address" id="input-sender-region-address" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($regions as $region): ?>
                                                <option value="<?php echo $region['region_id']; ?>" <?php if ($region['region_id'] == $sender_region_id_address): ?>selected<?php endif; ?>>
                                                    <?php echo $region['region_name_ua']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-city-address"><?php echo $entry_sender_city; ?></label>
                                    <div class="col-sm-9">
                                        <select name="sender_city_address" id="input-sender-city-address" class="form-control select2 custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-address"><?php echo $text_address; ?></label>
                                    <div class="col-sm-9">
                                        <select name="sender_address" id="input-sender-address" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-building"><?php echo $text_building; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_building" id="input-sender-building" class="form-control custom-input-70" <?php if ($parcel_info['sender']['building']): ?>value="<?php echo $parcel_info['sender']['building']; ?>"<?php endif; ?> placeholder="<?php echo $text_building; ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-floor"><?php echo $text_floor; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_floor" id="input-sender-floor" class="form-control custom-input-70"  <?php if ($parcel_info['sender']['floor'] ): ?>value="<?php echo $parcel_info['sender']['floor']; ?>"<?php endif; ?> placeholder="<?php echo $text_floor; ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-sender-apartment">Apartment:</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="sender_apartment" id="input-sender-apartment" class="form-control custom-input-70"  <?php if ($parcel_info['sender']['flat'] ): ?>value="<?php echo $parcel_info['sender']['flat']; ?>"<?php endif; ?> placeholder="Apartment">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title"><?php echo $text_recipient; ?></h3>
                            <div class="btn-group pull-right" data-toggle="buttons">
                                <label class="btn btn-default btn-sm<?php echo ($parcel_info['receiver']['service'] == 'Branch') ? ' active' : ''; ?>"
                                       data-toggle="tooltip"
                                       title="<?php echo $button_recipient_department_delivery; ?>">
                                    <input type="radio" name="recipient_address_type" value="department">
                                    <span class="btn-text"><?php echo $text_branch; ?></span>
                                </label>
                                <label class="btn btn-default btn-sm<?php echo ($parcel_info['receiver']['service'] == 'Door') ? ' active' : ''; ?>"
                                       data-toggle="tooltip"
                                       title="<?php echo $button_recipient_doors_delivery; ?>">
                                    <input type="radio" name="recipient_address_type" value="doors">
                                    <span class="btn-text"><?php echo $text_doors; ?></span>
                                </label>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body" id="recipient_department_delivery"
                                <?php if ($parcel_info['receiver']['service'] != 'Branch') { ?>
                                    style="display: none;"
                                <?php } ?>>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient"><?php echo $entry_recipient; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient" value="<?php echo $parcel_info['receiver']['name']; ?>" placeholder="<?php echo $entry_recipient; ?>" id="input-recipient" class="form-control custom-input-70" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_phone"><?php echo $entry_phone; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient_phone" value="<?php echo $parcel_info['receiver']['phone']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-recipient_phone" class="form-control custom-input-70" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_region"><?php echo $entry_region; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_region" id="input-recipient_region" class="form-control custom-select2">
                                            <?php foreach ($regions as $region): ?>
                                                <option value="<?php echo $region['region_id']; ?>" <?php if ($region['region_id'] == $branch_recipient_info['region_id'] ): ?>selected<?php endif; ?>>
                                                    <?php echo $region['region_name_ua']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_city"><?php echo $entry_city; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_city" id="input-recipient_city" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-branch" data-toggle="tooltip" data-placement="right" title="<?php echo $recipient_department_name; ?>"><?php echo $entry_branch; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_branch" id="input-recipient-branch" class="form-control selectpicker show-tick custom-select2" data-live-search="true">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="panel-body" id="recipient_address_delivery"
                                <?php if ($parcel_info['receiver']['service'] != 'Door') { ?>
                                    style="display: none;"
                                <?php } ?>>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-name-address"><?php echo $entry_recipient; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient-address" value="<?php echo $parcel_info['receiver']['name']; ?>" placeholder="<?php echo $entry_recipient; ?>" id="input-recipient" class="form-control custom-input-70" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_phone-address"><?php echo $entry_phone; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient_phone-address" value="<?php echo $parcel_info['receiver']['phone']; ?>" placeholder="<?php echo $entry_phone; ?>" id="input-recipient_phone" class="form-control custom-input-70" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_region_address"><?php echo $entry_region; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_region_address" id="input-recipient_region_address" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                            <?php foreach ($regions as $region): ?>
                                                <option value="<?php echo $region['region_id']; ?>" <?php if ($region['region_id'] == $receiver_region_id_address ): ?>selected<?php endif; ?>>
                                                    <?php echo $region['region_name_ua']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient_city_address"><?php echo $entry_city; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_city_address" id="input-recipient_city_address" class="form-control custom-select2">
                                            <?php if ($receiver_city_id_address): ?>
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($cities as $city): ?>
                                                    <?php if ($city['city_id'] == $receiver_city_id_address ): ?>
                                                        <option value="<?php echo $city['city_id']; ?>" selected>
                                                            <?php echo $city['name_ua']; ?>
                                                        </option>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            <?php else: ?>
                                                <option value=""><?php echo $text_select; ?></option>
                                            <?php endif; ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-address"><?php echo $text_address; ?></label>
                                    <div class="col-sm-9">
                                        <select name="recipient_address" id="input-recipient-address" class="form-control custom-select2">
                                            <option value=""><?php echo $text_select; ?></option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-building-address"><?php echo $text_building; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient_building_address" id="input-recipient-building-address" class="form-control custom-input-70" <?php if ($parcel_info['receiver']['building']): ?>value="<?php echo $parcel_info['receiver']['building']; ?>"<?php endif; ?>placeholder="<?php echo $text_building; ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-floor-address"><?php echo $text_floor; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient_floor_address" id="input-recipient-floor-address" class="form-control custom-input-70" <?php if ($parcel_info['receiver']['building']): ?>value="<?php echo $parcel_info['receiver']['floor']; ?>"<?php endif; ?>placeholder="<?php echo $text_floor; ?>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-recipient-apartment-address"><?php echo $text_apartment; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="recipient_apartment_address" id="input-recipient-apartment-address" class="form-control custom-input-70" <?php if ($parcel_info['receiver']['building']): ?>value="<?php echo $parcel_info['receiver']['flat']; ?>"<?php endif; ?> placeholder="<?php echo $text_apartment; ?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title"><?php echo $text_departure_options; ?></h3>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div id="places-container">
                                    <?php $index = 0; ?> <!-- Initialize the counter -->
                                    <?php foreach ($parcel_info['placesItems'] as $place): ?>
                                    <div class="place-item" data-index="<?php echo $index; ?>">
                                        <legend><?php echo $text_seat . ' ' . ($index + 1); ?></legend>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_weight; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][weight]" value="<?php echo $place['weight']; ?>" placeholder="<?php echo $entry_weight; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_kg; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_length; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][length]" value="<?php echo $place['length']; ?>" placeholder="<?php echo $entry_length; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_cm; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_width; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][width]" value="<?php echo $place['width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_cm; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_height; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][height]" value="<?php echo $place['height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_cm; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_quantity; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][quantity]" value="<?php echo $place['quantity']; ?>" placeholder="<?php echo $entry_quantity; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_pc; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?php echo $entry_insurance; ?></label>
                                            <div class="col-sm-9">
                                                <div class="input-group">
                                                    <input type="text" name="places[<?php echo $index; ?>][insurance]" value="<?php echo $place['insurance']; ?>" placeholder="<?php echo $entry_insurance; ?>" class="form-control custom-input-70"/>
                                                    <span class="input-group-addon addon-blue"><?php echo $text_uah; ?></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-9 col-sm-offset-3 text-right">
                                                <button type="button" class="btn btn-danger remove-place" style="display: <?php echo count($parcel_info['placesItems']) > 1 ? 'inline-block' : 'none'; ?>;"><?php echo $text_delete_seat; ?></button>
                                            </div>
                                        </div>
                                    </div>
                                    <?php $index++; ?> <!-- Increment the counter -->
                                    <?php endforeach; ?>
                                </div>
                                <div class="btn-container">
                                    <button type="button" class="btn btn-success pull-right" id="add-place"><?php echo $text_add_a_seat; ?></button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title"><?php echo $text_payment; ?></h3>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-delivery_payer"><?php echo $entry_delivery_payer; ?></label>
                                    <div class="col-sm-9">
                                        <div class="btn-group" data-toggle="buttons">
                                            <?php foreach ($references['payer_types'] as $v): ?>
                                                <?php if ($v['Ref'] == 'Receiver' and $parcel_info['receiverPay']): ?>
                                                    <label class="btn btn-default active">
                                                        <input type="radio" name="delivery_payer" value="<?php echo $v['Ref']; ?>" id="input-delivery_payer-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
                                                    </label>
                                                <?php elseif ($v['Ref'] == 'Sender' && !$parcel_info['receiverPay']): ?>
                                                    <label class="btn btn-default active">
                                                        <input type="radio" name="delivery_payer" value="<?php echo $v['Ref']; ?>" id="input-delivery_payer-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
                                                    </label>
                                                <?php else: ?>
                                                    <label class="btn btn-default">
                                                        <input type="radio" name="delivery_payer" value="<?php echo $v['Ref']; ?>" id="input-delivery_payer-<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?>
                                                    </label>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="input-payment_type"><?php echo $entry_payment_type; ?></label>
                                    <div class="col-sm-9">
                                        <div class="btn-group" data-toggle="buttons">
                                            <?php foreach ($references['payment_types'] as $v): ?>
                                                <?php if ($v['Ref'] == $parcel_info['payType'] ): ?>
                                                    <label class="btn btn-default active">
                                                        <input type="radio" name="payment_type" value="<?php echo $v['Ref']; ?>" id="input-payment_type-<?php echo $v['Ref']; ?>" checked><?php echo $v['Description']; ?>
                                                    </label>
                                                <?php else: ?>
                                                    <label class="btn btn-default">
                                                        <input type="radio" name="payment_type" value="<?php echo $v['Ref']; ?>" id="input-payment_type-<?php echo $v['Ref']; ?>"><?php echo $v['Description']; ?>
                                                    </label>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label" for="toggle-cod"><?php echo $text_cod; ?></label>
                                    <div class="col-sm-9">
                                        <label class="switch">
                                            <input type="checkbox" id="toggle-cod" name="cod_toggle">
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                </div>
                                <div class="cod-amount-container" style="display: none;">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="input-cod-amount"><?php echo $text_cod_amount; ?></label>
                                        <div class="col-sm-9">
                                            <div class="input-group">
                                                <input type="text" id="input-cod-amount" name="cod_amount" placeholder="<?php echo $text_enter_cod_amount; ?>" class="custom-input-70" />
                                                <span class="input-group-addon addon-blue"><?php echo $text_uah; ?></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group card-number-container">
                                        <label class="col-sm-3 control-label" for="input-card-number"><?php echo $text_card_number; ?></label>
                                        <div class="col-sm-9">
                                            <input type="text" id="input-card-number" name="card_number" placeholder="<?php echo $text_enter_card_number; ?>" class="custom-input-70" />
                                        </div>
                                    </div>
                                    <div class="form-group ownername-container">
                                        <label class="col-sm-3 control-label" for="input-ownername"><?php echo $text_ownername; ?></label>
                                        <div class="col-sm-9">
                                            <input type="text" id="input-ownername" name="ownername" placeholder="<?php echo $text_enter_ownername; ?>" class="custom-input-70"/>
                                        </div>
                                    </div>
                                    <div class="form-group ownermobile-container">
                                        <label class="col-sm-3 control-label" for="input-ownermobile"><?php echo $text_ownermobile; ?></label>
                                        <div class="col-sm-9">
                                            <input type="text" id="input-ownermobile" name="ownermobile" placeholder="<?php echo $text_enter_ownermobile; ?>" class="custom-input-70"/>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" name="meest2_cn_uuid" value="<?php echo $parcel_info['parcelID']; ?>" />
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="panel-heading clearfix">
                            <h3 class="panel-title"><?php echo $text_additionally; ?></h3>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="form-group parcel-number">
                                    <label class="col-sm-3 control-label" for="input-parcel-number"><?php echo $text_parcel_number; ?></label>
                                    <div class="col-sm-9">
                                        <input type="text" id="input-parcel-number" name="parcel_number" value="<?php echo $parcel_info['parcelNumber']; ?>" class="form-control custom-input-70" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    <?php else: ?>
        <div class="alert alert-danger">
            <p><?php echo !empty($get_info_error) ? $get_info_error : (isset($response['info']['message']) ? $response['info']['message'] : ''); ?></p>
        </div>
    <?php endif; ?>
</div>

<script type="text/javascript">
    window.meest2UpdateShipmentFormUrls = {
        ajax_get_cities_url: '<?php echo $ajax_get_cities_url; ?>',
        ajax_get_addresses_url: '<?php echo $ajax_get_addresses_url; ?>',
        ajax_get_branches_url: '<?php echo $ajax_get_branches_url; ?>',
        text_select: '<?php echo $text_select; ?>',
        place_index: "<?php echo count($parcel_info['placesItems']); ?>",
        branch_sender_info: {
            city_id: "<?php echo $branch_sender_info['city_id']; ?>"
        },
        branch_recipient_info: {
            city_id: "<?php echo $branch_recipient_info['city_id']; ?>"
        },
        parcel_info: {
            sender: {
                branchID: "<?php echo $parcel_info['sender']['branchID']; ?>",
                addressID: "<?php echo $parcel_info['sender']['addressID']; ?>"
            },
            receiver: {
                branchID: "<?php echo $parcel_info['receiver']['branchID']; ?>",
                addressID: "<?php echo $parcel_info['receiver']['addressID']; ?>"
            },
            COD: "<?php echo isset($parcel_info['COD']) ? $parcel_info['COD'] : ''; ?>",
            cardForCODNumber: '<?php echo isset($parcel_info['cardForCOD']['number']) ? $parcel_info['cardForCOD']['number'] : ''; ?>',
            cardForCODOwnername: '<?php echo isset($parcel_info['cardForCOD']['ownername']) ? $parcel_info['cardForCOD']['ownername'] : ''; ?>',
            cardForCODOwnermobile: '<?php echo isset($parcel_info['cardForCOD']['ownermobile']) ? $parcel_info['cardForCOD']['ownermobile'] : ''; ?>'
        },
        sender_city_id_address: '<?php echo $sender_city_id_address; ?>',
        receiver_city_id_address: '<?php echo $receiver_city_id_address; ?>',
        text_fill_required_fields: '<?php echo $text_fill_required_fields; ?>',
        text_seat: '<?php echo $text_seat; ?>',
        text_kg: '<?php echo $text_kg; ?>',
        text_cm: '<?php echo $text_cm; ?>',
        text_pc: '<?php echo $text_pc; ?>',
        text_uah: '<?php echo $text_uah; ?>',
        text_delete_seat: '<?php echo $text_delete_seat; ?>',
        entry_weight: '<?php echo $entry_weight; ?>',
        entry_length: '<?php echo $entry_length; ?>',
        entry_width: '<?php echo $entry_width; ?>',
        entry_height: '<?php echo $entry_height; ?>',
        entry_quantity: '<?php echo $entry_quantity; ?>',
        entry_insurance: '<?php echo $entry_insurance; ?>'
    };
</script>

<?php echo $footer; ?>
