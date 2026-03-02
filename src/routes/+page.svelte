<script lang="ts">
  let value: string = $state('');

  let withMask: string = $derived.by(() => {
    return value;
  });

  let withoutMask: string = $derived(value.replace(/[^a-zA-Z0-9]/g, ''));

  let isValid: boolean = $derived.by(() => {
    return validateCNPJ(withoutMask);
  });

  function validateCNPJ(cnpj: string): boolean {
    const regex = /^[a-zA-Z0-9]{14}$/;
    return regex.test(cnpj);
  }
</script>

<div class="flex min-h-screen items-center justify-center">
  <div class="w-full max-w-md">
    <div class="rounded-lg border p-4">
      <h1 class="text-2xl font-bold">CNPJ Alfanumérico</h1>

      <ul class="mt-4 list-disc pl-5">
        <li id="withMask">Com máscara: {withMask}</li>
        <li id="withoutMask">Sem máscara: {withoutMask}</li>
      </ul>
    </div>

    <div>
      <input
        class="mt-4 w-full rounded-lg border p-2"
        type="text"
        placeholder="Digite o CNPJ alfanumérico"
        bind:value
      />
      <div class="mt-1">
        {#if value.length > 0}
          {#if isValid}
            <span class="text-green-500">CNPJ válido</span>
          {:else}
            <span class="text-red-500">CNPJ inválido</span>
          {/if}
        {/if}
      </div>
    </div>
  </div>
</div>
