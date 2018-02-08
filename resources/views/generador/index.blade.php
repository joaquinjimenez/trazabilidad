@extends('voyager::master')

@section('page_title', __('voyager.generic.viewing').' '.__('voyager.generic.database'))

@section('page_header')
    <h1 class="page-title">
        <i class="voyager-data"></i> {{ __('voyager.generic.database') }}
        <a href="{{ route('voyager.database.create') }}" class="btn btn-success"><i class="voyager-plus"></i>
            {{ __('voyager.database.create_new_table') }}</a>
    </h1>
@stop
@section('content')

    <div class="page-content container-fluid">
      <h1> Son todos putos</h1>

      {{!! menu('generador') !!}}
    </div>
@stop
@section('javascript')

    <script>

        var table = {
            name: '',
            rows: []
        };

        new Vue({
            el: '#table_info',
            data: {
                table: table,
            },
        });

        $(function () {

            $('.bread_actions').on('click', '.delete', function (e) {
                id = $(this).data('id');
                name = $(this).data('name');

                $('#delete_builder_name').text(name);
                $('#delete_builder_form')[0].action += '/' + id;
                $('#delete_builder_modal').modal('show');
            });

            $('.database-tables').on('click', '.desctable', function (e) {
                e.preventDefault();
                href = $(this).attr('href');
                table.name = $(this).data('name');
                table.rows = [];
                $.get(href, function (data) {
                    $.each(data, function (key, val) {
                        table.rows.push({
                            Field: val.field,
                            Type: val.type,
                            Null: val.null,
                            Key: val.key,
                            Default: val.default,
                            Extra: val.extra
                        });
                        $('#table_info').modal('show');
                    });
                });
            });

            $('td.actions').on('click', '.delete_table', function (e) {
                table = $(this).data('table');
                if ($(this).hasClass('remove-bread-warning')) {
                    toastr.warning('{{ __('voyager.database.delete_bread_before_table') }}');
                } else {
                    $('#delete_table_name').text(table);
                    $('#delete_table_form')[0].action = $('#delete_table_form')[0].action.replace('__database', table);
                    $('#delete_modal').modal('show');
                }
            });

        });
    </script>
@stop
