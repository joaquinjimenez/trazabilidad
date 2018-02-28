@extends('pdf.layout_pdf')

@section('content')
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Descripción</th>
                <th>Stock</th>
            </tr>                            
        </thead>
        <tbody>
            @foreach($tareas as $product)
            <tr>
                <td>{{ $product->id }}</td>
                <td>{{ $product->body }}</td>
                <td>{{ $product->created_at }}</td>
                <td class="text-right">{{ $product->updated_at }}</td>
            </tr>
            @endforeach
            <tr>
                <td>chotà</td>
                <td>hòla</td>
                <td>dasd</td>
                <td class="text-right">fasfa</td>
            </tr>
        </tbody>
    </table>
@endsection